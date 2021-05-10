import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class WorldWeather {
  String longitude;
  String latitude;

  WorldWeather({this.longitude, this.latitude});

  Future<WeatherModel> getData() async {
    try {
      // print('This is long:$longitude');
      // print('this is lat:$latitude');
      Uri url = Uri.parse(
          'https://api.weatherbit.io/v2.0/current?lat=$latitude&lon=$longitude&key=0631a162ea0242368fd7f9e6f1893485');
      http.Response response = await http.post(url);
      if (response.statusCode == 200) {
        Map jsonData = jsonDecode(response.body);
        // print("DATA: $jsonData");
        return WeatherModel(
          timeZone: jsonData['data'][0]['timezone'],
          temp: jsonData['data'][0]['temp'] ?? 0,
          description: jsonData['data'][0]['weather']['description'],
          cloud: jsonData['data'][0]['clouds'],
          countryCode: jsonData['data'][0]['country_code'],
          location: jsonData['data'][0]['city_name'],
        );
      } else {
        throw Exception("There was some error");
      }
    } catch (e) {
      print("This is e: $e");
    }
    // TODO :Fetch TimeZone,Temperature,Clouds,Country Code
  }
}

class WeatherModel {
  double temp;
  String timeZone;
  String description;
  int cloud;
  String countryCode;
  String location;

  WeatherModel(
      {this.timeZone,
      this.temp,
      this.description,
      this.cloud,
      this.countryCode,
      this.location});
}
