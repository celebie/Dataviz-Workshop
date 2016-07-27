/*
 * Data Visualization Workshop
 * 01_Mappe - 01_ReadCSV
 * by Federico Pepe
*/

Table table;
IntDict province, tipologie;

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
  
  table = loadTable("data.csv", "header");
  
  province = new IntDict();
  tipologie = new IntDict();
  
  println("Numero di righe: " + table.getRowCount());
  println("Numero di colonne: " + table.getColumnCount());
  println();
  
  // Esempio 1
  for(int i = 0; i < table.getRowCount(); i++) {
    province.increment(table.getString(i, colProvincia)); 
    tipologie.increment(table.getString(i, colTipologia));
    
  }
  
  println(province);
  println(tipologie);  
}