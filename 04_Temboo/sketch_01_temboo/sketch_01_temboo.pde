import com.temboo.core.*;
import com.temboo.Library.Google.Geocoding.*;

// Create a session using your Temboo account application details

void setup() {
  // Run the GeocodeByAddress Choreo function
  runGeocodeByAddressChoreo();
}

void runGeocodeByAddressChoreo() {
  // Create the Choreo object using your Temboo session
  GeocodeByAddress geocodeByAddressChoreo = new GeocodeByAddress(session);

  // Set inputs
  geocodeByAddressChoreo.setAddress("Via Scuderlando, Verona");

  // Run the Choreo and store the results
  GeocodeByAddressResultSet geocodeByAddressResults = geocodeByAddressChoreo.run();
  
  // Print results
  println(geocodeByAddressResults.getLatitude());
  println(geocodeByAddressResults.getLongitude());
  println(geocodeByAddressResults.getResponse());

}