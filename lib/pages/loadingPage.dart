import 'package:flutter/material.dart';
import 'package:world_time/services/worldWeather.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String location;
  String cordination;
  double temp;
  String timeZone;
  String description;
  int cloud;
  String countryCode;

  void setWeatherLocation() async {
    print('This is Runnning');

    WorldWeather instance = WorldWeather(location: 'Dharwad', coordination: 'lat=15.4589&lon=75.0078');
    await instance.getData();

    //used to send arguments to homePage
    Navigator.pushReplacementNamed(context, '/homePage',arguments: {
    'location' : instance.location,
    'cordination' : instance.coordination,
    'temp' : instance.temp,
    'timeZone' : instance.timeZone,
    'description' : instance.description,
    'cloud' : instance.cloud,
    'countryCode' : instance.countryCode,
    });
    // setState(() {
    //   location = instance.location;
    //   cordination = instance.coordination;
    //   temp = instance.temp;
    //   timeZone = instance.timeZone;
    //   description = instance.description;
    //   cloud = instance.cloud;
    //   countryCode = instance.countryCode;
    // });
    // setState(() {
    //   String clouds = instance.cloud.toString();
    // });
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
            children: [
              // Text('This is Loading Page'),
              // Text('Clouds -$cloud'),
              // Text('Loocation -$location'),
              // Text('Coordinaion -$cordination'),
              // Text('Temperature -$temp'),
              // Text('Time-zone -$timeZone'),
              // Text('Description -$description'),
              // Text('Country Code-$countryCode'),
            ],
          ),
        ),
      ),
    );
  }
}
