/*
 * Data Visualization Workshop
 * Esempio 2: Tempo - 00_ReadCSV
 * by Federico Pepe
 */

Table table;

int codiceIstat = 23001;

int yearMin;
int yearMax;

FloatDict data = new FloatDict();

void setup() {
  getData();
}

void draw() {
}

void getData() {
  
  table = loadTable("data.csv", "header");
  
  data.clear();
  
  yearMin = table.getRow(0).getInt(0);
  yearMax = table.getRow(table.getRowCount()-1).getInt(0);
  
  for(int i = 0; i < table.getRowCount(); i++) {
    if(table.getInt(i, 1) == codiceIstat) {
      data.set(table.getString(i, 0), table.getFloat(i, 3));
    }
  }
  println(data);
  
}