/*
 * Data Visualization Workshop
 * Open Weather
 * by Federico Pepe
 */

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

JSONObject json;

// API KEY
String queryUrl = "http://api.openweathermap.org/data/2.5/weather?q=Verona,it&APPID="+APIKEY;

// VARIABLES
String sunrise;
String sunset;

void setup() {
  size(500, 500);
  pixelDensity(2);
  textAlign(LEFT, CENTER);
  
  noLoop();
  
  getData();
  
}

void draw() {
  
}

void drawGUI() {
  color cold = color(9, 113, 178);
  color hot = color(255, 252, 25);
  
  float temperature = kelvinToCelsius(json.getJSONObject("main").getFloat("temp"));
  int humidity = json.getJSONObject("main").getInt("humidity");
  int pressure = json.getJSONObject("main").getInt("pressure");
  String city = json.getString("name") + ", " + json.getJSONObject("sys").getString("country");
 
  background(lerpColor(cold, hot, map(temperature, -10, 40, 0, 1)));
  
  textSize(24);
  text(city, 10, 30);
  
  textSize(64);
  text(nfc(temperature, 1)+"° C", 10, height/5);
  
  textSize(18);
  text("Umidità: " + humidity + "% \nPressione: " + pressure + " SLM hPa", 10, height/2);
  //text("Pressione: " + pressure + " SLM hPa", 10, height/2 + 30);
  textSize(14);
  text("Alba: " + sunrise + "\nTramonto: " + sunset, 10, height-height/5);
  
  text("Ultimo aggiornamento: " + getDate(json.getInt("dt")), 10, height-30);
}

void getData() {
  json = loadJSONObject(queryUrl);
  
  sunrise = getDate(json.getJSONObject("sys").getInt("sunrise"));
  sunset = getDate(json.getJSONObject("sys").getInt("sunset"));
  
  drawGUI();
  
}

float kelvinToCelsius(float temp) {
  return temp - 273.15;
}

String getDate(int unix) {
  Date date = new Date(unix*1000L);
  SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); // the format of your date
  sdf.setTimeZone(TimeZone.getTimeZone("Europe/Rome"));
  return sdf.format(date);
}

void mousePressed() {
  getData();
}