/*
 * Data Visualization Workshop
 * Open Weather
 * by Federico Pepe
 */

JSONObject json;

String queryUrl = "http://api.openweathermap.org/data/2.5/weather?q=Verona,it&APPID="+APIKEY;

void setup() {
  getData();
}

void draw() {
}

void getData() {
  json = loadJSONObject(queryUrl);
  println(json);
}