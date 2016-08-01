/*
 * Data Visualization Workshop
 * 01_Mappe - 07_PieChart
 * by Federico Pepe
 */

Table table;
IntDict province, tipologie;
PImage map;

// Province
IntDict belluno, padova, rovigo, treviso, venezia, verona, vicenza;

// Variabili per accedere alle colonne del CSV in modo più semplice
int colProvincia = 0;
int colComune = 1;
int colTipologia = 2;

void setup() {
  size(800, 800);
  background(255);
  pixelDensity(2);
  map = loadImage("mappa_veneto.png");
  image(map, 50, 50);
  
  getData();
  
  displayData();
  
}

void draw() {
  
}

void displayData() {
  int dataMin = min(province.valueArray());
  int dataMax = max(province.valueArray());
  int rangeMin = 45;
  int rangeMax = 100;
  float diameter = 0;
  int value;
  
  stroke(0, 70);
  
  // VERONA
  value = province.get("VERONA");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  pieChart(190, 520, diameter, verona.valueArray(), verona.keyArray());
  // VICENZA
  value = province.get("VICENZA");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  pieChart(305, 430, diameter, vicenza.valueArray(), vicenza.keyArray());
  // PADOVA
  value = province.get("PADOVA");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  pieChart(405, 550, diameter, padova.valueArray(), padova.keyArray());
  // VENEZIA
  value = province.get("VENEZIA");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  pieChart(540, 530, diameter, venezia.valueArray(), venezia.keyArray());
  // ROVIGO
  value = province.get("ROVIGO");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  pieChart(420, 655, diameter, rovigo.valueArray(), rovigo.keyArray());
  // TREVISO
  value = province.get("TREVISO");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  pieChart(500, 380, diameter, treviso.valueArray(), treviso.keyArray());
  // BELLUNO
  value = province.get("BELLUNO");
  diameter = map(value, dataMin, dataMax, rangeMin, rangeMax);
  pieChart(482, 200, diameter, belluno.valueArray(), belluno.keyArray());

  // TIPOLOGIE
  int barX = 40;
  int barY = 40;
  textSize(12);

  for (int i = 0; i < tipologie.size(); i++) {
    String[] keys = tipologie.keyArray();
    fill(0);
    textAlign(LEFT, CENTER);
    text(keys[i], barX-5, barY+4);
    stroke(0, 70);
    fill(getColor(keys[i]));
    rect(barX-20, barY, 10, 10);
    barY += 25;
  }
}

void getData() {

  table = loadTable("data.csv", "header");

  province = new IntDict();
  tipologie = new IntDict();

  // Inizializzo per tutte le province
  belluno = new IntDict();
  padova = new IntDict();
  rovigo = new IntDict();
  treviso = new IntDict(); 
  venezia = new IntDict();
  verona = new IntDict(); 
  vicenza = new IntDict();

  // Acquisiamo tutti i dati della tabella
  for (int i = 0; i < table.getRowCount(); i++) {
    // Utilizzando la classe IntDict, filtriamo i dati
    String provincia = table.getString(i, colProvincia);
    String tipologia = table.getString(i, colTipologia);
    province.increment(provincia);
    tipologie.increment(tipologia);
    switch(provincia) {
    case "BELLUNO":
      belluno.increment(tipologia);
      break;
    case "PADOVA":
      padova.increment(tipologia);
      break;
    case "ROVIGO":
      rovigo.increment(tipologia);
      break;
    case "TREVISO":
      treviso.increment(tipologia);
      break;
    case "VENEZIA":
      venezia.increment(tipologia);
      break;
    case "VERONA":
      verona.increment(tipologia);
      break;
    case "VICENZA":
      vicenza.increment(tipologia);
      break;
    }
    tipologie.increment(tipologia);
  }

  // Riordiniamo in ordine discendente
  province.sortValuesReverse();
  tipologie.sortValuesReverse();
  belluno.sortKeys();
  padova.sortKeys();
  rovigo.sortKeys();
  treviso.sortKeys();
  venezia.sortKeys();
  verona.sortKeys();
  vicenza.sortKeys();

  println("*** DATA LOADED ***");
}

void pieChart(int xPos, int yPos, float diameter, int[] data, String[] keys) {
  int somma = 0;
  for (int i = 0; i < data.length; i++) {
    somma += data[i];
  }
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float radianti = map(data[i], 0, somma, 0, 360);
    fill(getColor(keys[i]));
    arc(xPos, yPos, diameter, diameter, lastAngle, lastAngle+radians(radianti));
    lastAngle += radians(radianti);
  }
}

color getColor(String tipo) {
  color[] riempimenti = {#a50026, 
    #d73027, 
    #f46d43, 
    #fdae61, 
    #fee090, 
    #ffffbf, 
    #e0f3f8, 
    #abd9e9, 
    #74add1, 
    #4575b4, 
    #313695};
  color riempimento = color(255);
  if (tipo.equals("AFFITTACAMERE")) {
    riempimento = riempimenti[0];
  }
  if (tipo.equals("AGRITURISMO")) {
    riempimento = riempimenti[1];
  }
  if (tipo.equals("ALBERGO")) {
    riempimento = riempimenti[2];
  }
  if (tipo.equals("ALTRA RICETTIVITA'")) {
    riempimento = riempimenti[3];
  }
  if (tipo.equals("APPARTAMENTO")) {
    riempimento = riempimenti[4];
  }
  if (tipo.equals("BED AND BREAKFAST")) {
    riempimento = riempimenti[5];
  }
  if (tipo.equals("CAMPEGGIO")) {
    riempimento = riempimenti[6];
  }
  if (tipo.equals("RESIDENCE")) {
    riempimento = riempimenti[7];
  }
  if (tipo.equals("RIFUGIO")) {
    riempimento = riempimenti[8];
  }
  if (tipo.equals("COUNTRY HOUSE")) {
    riempimento = riempimenti[9];
  }
  if (tipo.equals("FORESTERIA")) {
    riempimento = riempimenti[10];
  }
  return riempimento;
}