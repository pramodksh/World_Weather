import 'package:flutter/material.dart';
import 'package:world_time/services/worldWeather.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldWeather> locations =[
    WorldWeather(location: 'Dharwad', coordination: 'lat=15.4589&lon=75.0078'),
    WorldWeather(location: 'Hubli', coordination: 'lat=15.4589&lon=75.1240'),
    WorldWeather(location: 'Belgaum', coordination: 'lat=15.8497&lon=74.4977'),
    WorldWeather(location: 'Mysore', coordination: 'lat=12.2958&lon=76.6394'),
    WorldWeather(location: 'Bagalkot', coordination: 'lat=16.1691&lon=75.6615'),
    WorldWeather(location: 'Gokak', coordination: 'lat=16.1592&lon=74.8156'),
    WorldWeather(location: 'Bellari', coordination: 'lat=15.1394&lon=76.9214'),
  ];

  void updateLocation(index) async{
    WorldWeather instance = locations[index];
    // print(locations[index]);
    await instance.getData();
    await print(instance.location);
    // //navigate to Home Page
    Navigator.pop(context,{
      'location' : instance.location,
      'coordination' : instance.coordination,
      'temp' : instance.temp,
      'timeZone' : instance.timeZone,
      'description' : instance.description,
      'cloud' : instance.cloud,
      'countryCode' : instance.countryCode,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        elevation: 100 ,
        title:Text('Choose Location'),
        backgroundColor: Colors.grey[800],
        toolbarOpacity: 0.8,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                // print(locations[index]);
                // print(index);
                updateLocation(index);
              },
              title: Text(locations[index].location),
            ),
          );
        },
      ),
    );
  }
}
