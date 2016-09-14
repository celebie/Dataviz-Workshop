/*
 * Data Visualization Workshop
 * Caricare dati da remoto in modo asincrono
 * by Federico Pepe
 * Update URL: http://tiny.cc/currenttime
 */


JSONObject json;
int x = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  stroke(255);
  line(x, 0, x, height);
  x = x+10;
  if(x > width) {
    x = 0;
  }
  thread("getData");
}

void getData() {
  json = loadJSONObject("https://script.googleusercontent.com/a/macros/echo?user_content_key=6HbijiUdsA8iCFJ77E2-0CJ--oWgxIBG4NOpLE3Svwy_FVLiLpSRXMjhAB3hvOxydlBLIrMkcBMFjjpvGenzBIT58kBVTGPDOJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMi80zadyHLKDQM2R_7SyghOR3ObssIDbW7ys-jMFyi0fpci0VBcGTo-j241DyspKP6WG5S4SlBgDIEUVuHzb3YedzyQPFDWXjcBtW8Ny55b2Vs-1Js9rn0NGBOQKiC4dc7mnKe8gH_GyNqqwjtD8xNw&lib=MwxUjRcLr2qLlnVOLh12wSNkqcO1Ikdrk");
  drawData(); 
}

void drawData() {
  println(json.getInt("hours") + ":" + json.getInt("minutes") + ":" + json.getInt("seconds"));
}