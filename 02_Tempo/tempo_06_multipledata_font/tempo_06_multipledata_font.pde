/*
 * Data Visualization Workshop
 * Esempio 2: Tempo - 06_multipledata_font
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

int padding = 75;

int[] istatArray = {23091, 24116, 28060, 26086, 27042, 29041, 25006 };
color[] colorArray = {#7fc97f, #beaed4, #fdc086, #ffff99, #386cb0, #f0027f, #bf5b17};

PFont myFont;

void setup() {
  size(1000, 700);
  pixelDensity(2);
  myFont = createFont("Avenir-Book", 32);
  textFont(myFont);
}

void draw() {
  cityName = "";
  getData();
  drawGUI();

  for (int i = 0; i < istatArray.length; i++) {
    codiceIstat = istatArray[i];
    stroke(colorArray[i]);
    getData();
    highLightData();
    drawData();
    if (cityName.equals("")) {
      cityName = codiciIstat.get(str(codiceIstat));
    } else {
      cityName = cityName + " - " + codiciIstat.get(str(codiceIstat));
    }
  }
  // TITLE
  textAlign(LEFT);
  textSize(24);
  fill(0);
  text(cityName, padding/2, padding-30);
}

void highLightData() {
  float xPos;
  float yPos;
  for (int i = 0; i < data.size(); i++) {
    xPos = map(float(data.keyArray()[i]), yearMin, yearMax, padding, width-padding);
    yPos = map(data.valueArray()[i], dataMin, dataMax, height-padding, padding);
    if (dist(mouseX, mouseY, xPos, yPos) < 10) {
      textSize(10);
      textAlign(CENTER);
      text(nf(data.valueArray()[i], 0, 2), xPos, yPos-8);
    }
  }
}

void drawData() {
  
  strokeWeight(2);
  noFill();
  float xPos;
  float yPos;
  beginShape();
  for (int i = 0; i < data.size(); i++) {
    
    xPos = map(float(data.keyArray()[i]), yearMin, yearMax, padding, width-padding);
    yPos = map(data.valueArray()[i], dataMin, dataMax, height-padding, padding);
    ellipse(xPos, yPos, 5, 5);
    vertex(xPos, yPos);
    if (i == data.size()-1) {
      textSize(12);
      text(codiciIstat.get(str(codiceIstat)), xPos + (padding/2.5), yPos+4);
    }
  }
  endShape();
}

void drawGUI() {
  background(255);

  strokeWeight(1);
  stroke(0, 50);
  fill(127);

  int increment = 25;
  
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

  dataMin = allData.min();
  dataMax = allData.max();
}