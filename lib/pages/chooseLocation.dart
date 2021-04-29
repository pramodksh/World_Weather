import 'package:flutter/material.dart';
import 'package:world_time/services/worldWeather.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // WorldWeather inst = WorldWeather();
  // inst.location = ;
  // inst.coordination = ;

  List<WorldWeather> locations =[
    WorldWeather(longitude:'15.4589',latitude:'75.0078'),
    WorldWeather(longitude:'15.8497',latitude:'75.1240'),
    WorldWeather(longitude:'12.2958',latitude:'76.6394'),
    WorldWeather(longitude:'16.1691',latitude:'75.6615'),
    WorldWeather(longitude:'16.1592',latitude:'74.8156'),
    WorldWeather(longitude:'15.1394',latitude:'76.9214'),
  ];

  Future updateLocation(index) async{
    WorldWeather instance = locations[index];
    // print(locations[index]);
    await instance.getData();
    return instance;
    // await print(instance.location);
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
              onTap: () async {
                WorldWeather instance = await updateLocation(index);
                // //navigate to Home Page
                Navigator.pop(context,{
                  // 'location' : instance.location,
                  // 'coordination' : instance.coordination,
                  // 'temp' : instance.temp,
                  // 'timeZone' : instance.timeZone,
                  // 'description' : instance.description,
                  // 'cloud' : instance.cloud,
                  // 'countryCode' : instance.countryCode,
                });

              },
              // title: Text(locations[index].location),
            ),
          );
        },
      ),
    );
  }
}
