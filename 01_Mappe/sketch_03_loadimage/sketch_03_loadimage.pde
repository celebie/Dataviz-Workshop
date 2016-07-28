/*
 * Data Visualization Workshop
 * 01_Mappe - 03_LoadImage
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
int colStelle = 3;
int colNome = 4;
int colIndirizzo = 5;
int colCivico = 6;
int colCAP = 7;

void setup() {
  size(800, 800);
  background(255);
 
  map = loadImage("mappa_veneto.png");
  image(map, 50, 50);
  
  getData();
}

void draw() {
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