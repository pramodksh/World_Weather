import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class WorldWeather {
  String location;
  String coordination;
  double temp;
  String timeZone;
  String description;
  int cloud;
  String countryCode;

  WorldWeather({this.location, this.coordination});

  Future<void> getData() async {
    // var requestBody = json.encode({
    //   'lat': '15.4589',
    //   'lon': '75.0078',
    //   'key': "0631a162ea0242368fd7f9e6f1893485",
    // });

    try {
      Uri url = Uri.parse(
          'https://api.weatherbit.io/v2.0/current?$coordination&key=0631a162ea0242368fd7f9e6f1893485');

      http.Response response = await http.post(url);

      // await http.post(url, body: requestBody);
      // This line of code works for http ^0.12.2
      // await http.get('https://api.weatherbit.io/v2.0/current?lat=15.4589&lon=75.0078&key=0631a162ea0242368fd7f9e6f1893485');

      print(response.statusCode);
      if (response.statusCode == 200) {
        Map jsonData = jsonDecode(response.body);
        timeZone = jsonData['data'][0]['timezone'];
        temp = jsonData['data'][0]['temp'];
        description = jsonData['data'][0]['weather']['description'];
        cloud = jsonData['data'][0]['clouds'];
        countryCode = jsonData['data'][0]['country_code'];
        // print(response.body);
        // print("DATA- $temp");
        // print("Location- $location");
        // print("Timezone- $timeZone");
        // print("Description- $description");
        // print("Cloud- $cloud");
        // print("CountryCode- $countryCode");
      } else {
        throw Exception("There was some error");
      }
    } catch (e) {
      print("This is e: ${e}");
    }

    // TODO :Fetch TimeZone,Temperature,Clouds,Country Code
  }
}
