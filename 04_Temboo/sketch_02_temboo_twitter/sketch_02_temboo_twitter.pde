import com.temboo.core.*;
import com.temboo.Library.Twitter.Search.*;

// Create a session using your Temboo account application details

void setup() {
  // Run the LatestTweet Choreo function
  runLatestTweetChoreo();
}

void runLatestTweetChoreo() {
  // Create the Choreo object using your Temboo session
  LatestTweet latestTweetChoreo = new LatestTweet(session);

  // Set inputs
  latestTweetChoreo.setQuery("#Verona");
  latestTweetChoreo.setConsumerKey("a6pshdQDzZHgrq6N6slDPyb8I");
  latestTweetChoreo.setAccessToken("38745828-3iJLBU6kYiBf3Ykkdch2tKe5JnduQZnOAydpgeRVX");
  latestTweetChoreo.setConsumerSecret("tlvALBZLEMEAclJSt90TqpwuX5dejM1MnASEnhhXjwdcV33UE8");
  latestTweetChoreo.setAccessTokenSecret("taMKk17hF94rfNPBF503s9EiOgPE3WLbgJzFhgV6YsYkI");

  // Run the Choreo and store the results
  LatestTweetResultSet latestTweetResults = latestTweetChoreo.run();
  
  // Print results
  println(latestTweetResults.getID());
  println(latestTweetResults.getLimit());
  println(latestTweetResults.getRemaining());
  println(latestTweetResults.getReset());
  println(latestTweetResults.getScreenName());
  println(latestTweetResults.getText());
  println(latestTweetResults.getResponse());

}