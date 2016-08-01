/*
 * Data Visualization Workshop
 * 01_Mappe - 05_DisplayData
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
  int value;
  float diameter = 35;
  float percent;
  color riempimento;

  noStroke();

  // VERONA
  value = province.get("VERONA");
  percent = norm(value, dataMin, dataMax);
  riempimento = lerpColor(#D8E6EC, #005A85, percent, HSB);
  fill(riempimento);
  ellipse(190, 520, diameter, diameter);
  // VICENZA
  value = province.get("VICENZA");
  percent = norm(value, dataMin, dataMax);
  riempimento = lerpColor(#D8E6EC, #005A85, percent, HSB);
  fill(riempimento);
  ellipse(320, 430, diameter, diameter);
  // PADOVA
  value = province.get("PADOVA");
  percent = norm(value, dataMin, dataMax);
  riempimento = lerpColor(#D8E6EC, #005A85, percent, HSB);
  fill(riempimento);
  ellipse(400, 550, diameter, diameter);
  // VENEZIA
  value = province.get("VENEZIA");
  percent = norm(value, dataMin, dataMax);
  riempimento = lerpColor(#D8E6EC, #005A85, percent, HSB);
  fill(riempimento);
  ellipse(540, 530, diameter, diameter);
  // ROVIGO
  value = province.get("ROVIGO");
  percent = norm(value, dataMin, dataMax);
  riempimento = lerpColor(#D8E6EC, #005A85, percent, HSB);
  fill(riempimento);
  ellipse(420, 660, diameter, diameter);
  // TREVISO
  value = province.get("TREVISO");
  percent = norm(value, dataMin, dataMax);
  riempimento = lerpColor(#D8E6EC, #005A85, percent, HSB);
  fill(riempimento);
  ellipse(500, 380, diameter, diameter);
  // BELLUNO
  value = province.get("BELLUNO");
  percent = norm(value, dataMin, dataMax);
  riempimento = lerpColor(#D8E6EC, #005A85, percent, HSB);
  fill(riempimento);
  ellipse(480, 200, diameter, diameter);
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

  println("*** DATA LOADED ***");
}
