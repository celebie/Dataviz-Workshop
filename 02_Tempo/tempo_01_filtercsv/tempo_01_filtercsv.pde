/*
 * Data Visualization Workshop
 * Esempio 2: Tempo - 01_filterCSV
 * by Federico Pepe
 */

Table table;

int codiceIstat = 23001;

int yearMin;
int yearMax;

float dataMin;
float dataMax;

String cityName = "";

FloatDict data = new FloatDict();

void setup() {
  size(700, 500);
  
  getData();
  
  drawData();
}

void draw() {
 
}

void drawData() {
  text(cityName, 10, 10);
  
}

void drawGUI() {
}

void getData() {
  
  table = loadTable("data.csv", "header");
  
  data.clear();
  
  cityName = table.findRow(str(codiceIstat),1).getString(2);
  
  yearMin = table.getRow(0).getInt(0);
  yearMax = table.getRow(table.getRowCount()-1).getInt(0);
  
  for(int i = 0; i < table.getRowCount(); i++) {
    if(table.getInt(i, 1) == codiceIstat) {
      data.set(table.getString(i, 0), table.getFloat(i, 3));
    }
  }
  
  //println(data);
  dataMin = min(data.valueArray());
  dataMax = max(data.valueArray());
  println("*** DATA LOADED ***");
}