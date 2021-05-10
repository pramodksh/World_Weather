import 'package:flutter/material.dart';
import 'package:world_time/services/worldWeather.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String location;
  String coordination;
  double temp;
  String timeZone;
  String description;
  int cloud;
  String countryCode;

  void setWeatherLocation() async {
    WorldWeather instance =
        WorldWeather(latitude: '15.4589', longitude: '75.0078');
    WeatherModel object = await instance.getData();

    //used to send arguments to homePage
    Navigator.pushReplacementNamed(context, '/homePage', arguments: {
      'object': object,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setWeatherLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
