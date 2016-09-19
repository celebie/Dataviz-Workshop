 /*
 * Data Visualization Workshop
 * Esempio 2: Tempo - 02_displayData
 * by Federico Pepe
 */

Table table;

int codiceIstat = 23001;

int yearMin;
int yearMax;

float dataMin;
float dataMax;

String cityName = "";

StringDict codiciIstat = new StringDict();
FloatDict data = new FloatDict();
FloatList allData = new FloatList();

int padding = 75;

void setup() {
  size(1000, 700);
  getData();
  drawGUI();
  drawData();
}

void draw() {
}

void drawData() {

  stroke(0);
  strokeWeight(5);

  float xPos;
  float yPos;

  for (int i = 0; i < data.size(); i++) {
    xPos = map(float(data.keyArray()[i]), yearMin, yearMax, padding, width-padding);
    yPos = map(data.valueArray()[i], dataMin, dataMax, height-padding, padding);
    point(xPos, yPos);
  }
}

void drawGUI() {
  background(255);
  // TITLE
  textAlign(LEFT);
  textSize(24);
  fill(0);
  text(cityName, padding/2, padding-20);

  strokeWeight(1);
  stroke(0, 50);
  fill(127);

  // HORIZONTAL LINE
  for (int i = yearMin; i <= yearMax; i++) {
    float xPos = map(i, yearMin, yearMax, padding, width-padding);
    line(xPos, padding, xPos, height-padding);
    textSize(10);
    textAlign(CENTER);
    text(i, xPos, (height-padding)+20);
  }
  // VERTICAL
  for (int i = round(dataMin); i <= round(dataMax); i+= 25) {
    float yPos = map(i, dataMin, dataMax, height-padding, padding);
    if (i % 125 == 0 && i != 0) {
      stroke(0, 50);
      line(padding, yPos, width-padding, yPos);
      textAlign(RIGHT);
      text(i, padding-10, yPos+2);
    } else {
      stroke(0, 15);
      line(padding, yPos, width-padding, yPos);
    }
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
  drawGUI();
  drawData();
}