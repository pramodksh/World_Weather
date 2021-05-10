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
    // print('Home page:');

    var object = ModalRoute.of(context)
        .settings
        .arguments as Map;
    // dynamic data1 = object['data'];
    // print('Home Page -> Model Route :${ModalRoute.of(context)
    //     .settings
    //     .arguments}');
    // print('Home Page : ${object}');
    print('Home Page -> Type of Object  ${object.runtimeType}');

    model = model == null ? object['object'] : model;
    print('Home Page -> Typeof Model : ${model.runtimeType} ');
    if(model==null){
      print('After Model is Null ');
    }
    else{
      print('After Model is not Null!!! ${model} ');
    }

    // print(model.location);
    print("Object returned from chooseLocation :${object['data']}");
    print("Model returned from chooseLocation :${model.description}");

    // var data = model != null ? model : ModalRoute.of(context)
    //     .settings
    //     .arguments as Map; // Used to take data from loading page.
    // print(data);




    // String tempStr =data['temp'].toString() ?? 0;
    // String timeZone = data['timeZone'] ?? "";
    // String description = data['description'] ?? "";
    // int cloud = data['cloud'] ?? 0;
    // String countryCode = data['countryCode'] ?? "";
    // // print(data['temp'].runtimeType);
    // // data['temp']=25;
    // print(data['temp'].runtimeType);
    //
    // if(data['temp']>=30){
       image ='summer';
    //    print('summer');
    // } else if(data['temp']<20){
    //    image = 'winter';
    //    print('winter');
    //
    // } else{
    //    image = 'spring';
    //    print('spring');
    //
    // }
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$image.jpg'),
              // image: AssetImage('assets/spring.jpg'),
              fit:BoxFit.cover
            ),
          ),
          child: Center(
            child: Column(
              children: [
                // // todo remove
                // RaisedButton(
                //   onPressed: () async{
                //     WeatherModel result = await WorldWeather().getAPiData();
                //     print("RESULT: ${result} | TYPE: ${result.runtimeType}");
                //     print("RESULT: ${result.temp} ");
                //   },
                //   child: Text("DEMO"),
                // ),
                // // todo remove
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: TextButton.icon(
                    onPressed: () async{
                      dynamic result =
                              await Navigator.pushNamed(context, '/chooseLocation');
                      print('This is result  :  {$result}');
                      print('Result :  ${result['object']}');
                      print(' Result Type : ${result.runtimeType}');
                      // print('Typeof object of object is :${object['object'].runtimeType}');


                      setState(() {
                          model = result['object'];
                          // data = {
                          // 'location' : result['location'],
                          // 'coordination' : result['coordination'],
                          // 'temp' : result['temp'],
                          // 'timeZone' : result['timeZone'],
                          // 'description' : result['description'],
                          // 'cloud' : result['cloud'],
                          // 'countryCode' : result['countryCode'],
                        // };
                      });
                    },
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                          // color: Colors.white12,
                          color: Colors.black),
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
                ), Text(
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
                    fontSize:20,
                  ),
                ),
                Text(
                  '${model.cloud}',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize:20,
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
