/*
 * Data Visualization Workshop
 * Esempio 2: Tempo - 01_filterCSV
 * by Federico Pepe
 */

Table table;

int codiceIstat = 23091;

int yearMin;
int yearMax;

float dataMin;
float dataMax;

String cityName = "";

StringDict codiciIstat = new StringDict();
FloatDict data = new FloatDict();
FloatList allData = new FloatList();

void setup() {
  size(1000, 700);

  getData();

  drawData();
}

void draw() {
}

void drawData() {
  text(cityName, 10, 30);
  strokeWeight(5);
  int padding = 50;
  float xPos;
  float yPos;

  for (int i = 0; i < data.size(); i++) {
    xPos = map(float(data.keyArray()[i]), yearMin, yearMax, padding, width-padding);
    yPos = map(data.valueArray()[i], dataMin, dataMax, height-padding, padding*2);
    point(xPos, yPos);
  }
}

void getData() {
  
  background(127); 

  table = loadTable("data.csv", "header");

  data.clear();

  yearMin = table.getRow(0).getInt(0);
  yearMax = table.getRow(table.getRowCount()-1).getInt(0);

  // FILTER DATA
  for (int i = 0; i < table.getRowCount(); i++) {
    allData.set(i, table.getFloat(i, 3));
    codiciIstat.set(table.getString(i, 1), table.getString(i, 2));

    if (table.getInt(i, 1) == codiceIstat) {
      data.set(table.getString(i, 0), table.getFloat(i, 3));
    }
  }
  cityName = codiciIstat.get(str(codiceIstat));
  //dataMin = min(data.valueArray());
  //dataMax = max(data.valueArray());
  dataMin = allData.min();
  dataMax = allData.max();
}

void mousePressed() {
  int arraySize = codiciIstat.size();
  int random = int(random(arraySize));
  String codice = codiciIstat.keyArray()[random];
  codiceIstat = int(codice);
  getData();
  drawData();
}