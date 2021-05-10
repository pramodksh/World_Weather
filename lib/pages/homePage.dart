import 'package:flutter/material.dart';
import 'package:world_time/pages/chooseLocation.dart';
import 'package:world_time/services/worldWeather.dart';

/*
loading - pen
home - pen pencil
*/

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel model;
  String image;

  @override
  Widget build(BuildContext context) {
    var object = ModalRoute.of(context).settings.arguments as Map;
    model = model == null ? object['object'] : model;

    double temperature = double.parse(model.temp);

    if (temperature >= 30) {
      image = 'summer';
    } else if (temperature < 20) {
      image = 'winter';
    } else {
      image = 'spring';
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$image.jpg'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/chooseLocation');
                      print('This is result  :  {$result}');
                      print('Result :  ${result['object']}');
                      print(' Result Type : ${result.runtimeType}');

                      setState(() {
                        model = result['object'];
                      });
                    },
                    label: Text(
                      'Edit Location',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Icon(
                      Icons.edit_location_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.location,
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 42,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                Text(
                  '${model.temp}°',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 92,
                  ),
                ),
                Text(
                  "${model.timeZone}",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${model.countryCode}',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${model.description}',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${model.cloud}',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
