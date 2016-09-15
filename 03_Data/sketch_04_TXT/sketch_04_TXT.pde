IntDict dictionary = new IntDict();
String[] words;

int counter = 0;

void setup() {
  size(500, 500);
  String[] lines = loadStrings("book.txt");
  String allText = join(lines, " ");
  words = splitTokens(allText, " ,.:;!'");

  for (int i = 0; i < words.length; i++) {
    dictionary.increment(words[i]);
  }

  dictionary.sortValues();
  //println(dictionary);
}

void draw() {
  background(0);
  textSize(64);
  textAlign(CENTER);
  text(words[counter], width/2, height/2);
  counter++;
  if(counter == words.length) {
    counter = 0;
  }
}