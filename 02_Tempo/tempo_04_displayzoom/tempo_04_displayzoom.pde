/*
 * Data Visualization Workshop
 * Esempio 2: Tempo - 04_displayData
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

boolean zoom = false;

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
  strokeWeight(1);
  noFill();
  float xPos;
  float yPos;
  beginShape();
  for (int i = 0; i < data.size(); i++) {
    xPos = map(float(data.keyArray()[i]), yearMin, yearMax, padding, width-padding);
    yPos = map(data.valueArray()[i], dataMin, dataMax, height-padding, padding);
    ellipse(xPos, yPos, 2, 2);
    vertex(xPos, yPos);
  }
  endShape();
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

  int increment;

  if (zoom) {
    increment = 1;
  } else {
    increment = 25;
  }

  // HORIZONTAL LINE
  for (int i = yearMin; i <= yearMax; i++) {
    float xPos = map(i, yearMin, yearMax, padding, width-padding);

    if (i % 5 == 0) {
      textSize(10);
      textAlign(CENTER);
      text(i, xPos, (height-padding)+20);
      strokeWeight(2);
    } else {
      strokeWeight(1);
    }
    line(xPos, padding, xPos, height-padding);
  }
  // VERTICAL
  for (int i = floor(dataMin); i <= floor(dataMax); i+= increment) {
    float yPos = map(i, dataMin, dataMax, height-padding, padding);
    if (yPos <= height-padding && yPos >= padding) {
      if (i % (increment*4) == 0 && i != 0) {
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

  textSize(12);
  textAlign(CENTER);
  text("Densità territoriali (popolazione/superficie in kmq) dei comuni del Veneto 1990-2014, dati Open Data Veneto", width/2, height-padding/3);
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
  // ENABLE ZOOM
  if (zoom) {
    dataMin = min(data.valueArray());
    dataMax = max(data.valueArray());
  } else {
    dataMin = allData.min();
    dataMax = allData.max();
  }
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

void keyPressed() {
  if (key == 'z') {
    zoom = !zoom;
    getData();
    drawGUI();
    drawData();
  }
}