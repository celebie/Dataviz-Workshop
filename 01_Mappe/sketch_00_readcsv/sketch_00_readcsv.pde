/*
 * Data Visualization Workshop
 * 01_Mappe - 00_ReadCSV
 * by Federico Pepe
*/

Table table;

void setup() {
  table = loadTable("data.csv", "header");
  
  println("Numero di righe: " + table.getRowCount());
  println("Numero di colonne: " + table.getColumnCount());
  
  // Esempio 1
  for(int i = 0; i < table.getRowCount(); i++) {
    println(table.getString(i, 2));
  }
  
  // Esempio 2
  for(TableRow row : table.rows()) {
    println(row.getString(0));
  }
   
}