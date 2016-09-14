/*
 * Data Visualization Workshop
 * Open Weather
 * by Federico Pepe
 */

XML xml;

// API KEY

String queryUrl = "http://api.openweathermap.org/data/2.5/weather?q=Verona,it&mode=xml&APPID="+APIKEY;

void setup() {
  size(500, 500);
  pixelDensity(2);
  textAlign(LEFT, CENTER);
  
  noLoop();
  
  getData();
  drawGUI();
  
}

void draw() {
  
}

void drawGUI() {
  color cold = color(9, 113, 178);
  color hot = color(255, 252, 25);
  
  float temperature = kelvinToCelsius(xml.getChild("temperature").getFloat("value"));
  int humidity = xml.getChild("humidity").getInt("value");
  int pressure = xml.getChild("pressure").getInt("value");
  String city = xml.getChild("city").getString("name") + ", " + xml.getChild("city").getChild("country").getContent().toString();
 
  background(lerpColor(cold, hot, map(temperature, -10, 40, 0, 1)));
  
  textSize(24);
  text(city, 10, 30);
  
  textSize(64);
  text(nfc(temperature, 1)+"° C", 10, height/5);
  
  textSize(18);
  text("Umidità: " + humidity + "% \nPressione: " + pressure + " SLM hPa", 10, height/2);
  textSize(14);
  
}

void getData() {
  xml = loadXML(queryUrl);
}

float kelvinToCelsius(float temp) {
  return temp - 273.15;
}

void mousePressed() {
  getData();
  drawGUI();
}