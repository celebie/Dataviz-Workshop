// LIBRERIE
import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;
// VARIABILI
Twitter twitter;
String searchString = "#Verona";
List<Status> tweets;
int currentTweet = 0;

IntDict dictionary = new IntDict();

void setup() {
  size(800, 600);
  // TWITTER CONFIGURATION
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey(CONSUMERKEY);
  cb.setOAuthConsumerSecret(CONSUMERSECRET);
  cb.setOAuthAccessToken(ACCESSTOKEN);
  cb.setOAuthAccessTokenSecret(TOKENSECRET);

  TwitterFactory tf = new TwitterFactory(cb.build());

  twitter = tf.getInstance();
  getNewTweets();
  frameRate(1);
}

void draw() {
  background(0);

  currentTweet = currentTweet + 1;

  if (currentTweet >= tweets.size())
  {
    currentTweet = 0;
  }

  Status status = tweets.get(currentTweet);

  String[] list = split(status.getText(), ' ');
  for (int i = 0; i < list.length; i++) {
    dictionary.increment(list[i]);
  }
  fill(200);
  //text(status.getText(), width/2, height/2, 300, 200);
  dictionary.sortValuesReverse();
  println(dictionary);
}

void getNewTweets() {
  try {
    Query query = new Query(searchString);
    QueryResult result = twitter.search(query);
    tweets = result.getTweets();
  }
  catch (TwitterException te) {
    println("Failed to search tweets: " + te.getMessage());
  }
}