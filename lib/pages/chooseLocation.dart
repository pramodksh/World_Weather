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
    WorldWeather(latitude:'15.4589',longitude:'75.0078'),
    WorldWeather(latitude:'15.8497',longitude:'75.1240'),
    WorldWeather(latitude:'12.2958',longitude:'76.6394'),
    WorldWeather(latitude:'16.1691',longitude:'75.6615'),
    WorldWeather(latitude:'16.1592',longitude:'74.8156'),
    WorldWeather(latitude:'15.1394',longitude:'76.9214'),
  ];

  List<String> LocationNames = ['Hubli','Saundatti','Mysore','Bagalkot','Gokak','Bellary'];

  Future updateLocation(index) async{
    WorldWeather instance = locations[index];
    WeatherModel getDataInstance = await instance.getData();
    print(instance.getData());
    print(' This is getData :  $instance');
    print(' ChooseLocation : This is type of get data ${getDataInstance.runtimeType}');
    return getDataInstance ;
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
                WeatherModel instance = await updateLocation(index);
                print(instance.description);

                // return instance;

                // print(instance.longitude);
                // //navigate to Home Page
                Navigator.pop(context,{
                  'object' : instance ,
                  // 'data':instance,
                  // 'latitude' : instance.latitude,
                  // 'longitude' : instance.longitude,
                  // 'location' : instance.location,
                  // 'coordination' : instance.coordination,
                   // 'temp' : instance.temp,
                  // 'timeZone' : instance.timeZone,
                  // 'description' : instance.description,
                  // 'cloud' : instance.cloud,
                  // 'countryCode' : instance.countryCode,
                });

              },
              title: Text(LocationNames[index]),
            ),

          );
        },
      ),
    );
  }
}
