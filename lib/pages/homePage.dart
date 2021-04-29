import 'package:flutter/material.dart';
import 'package:world_time/pages/chooseLocation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  String image;

  @override
  Widget build(BuildContext context) {
    print('Home page:');
    data = data.isNotEmpty ? data : ModalRoute.of(context)
        .settings
        .arguments; // Used to take data from loading page.
    print(data);
    String tempStr =data['temp'].toString();
    String timeZone = data['timeZone'];
    String description = data['description'];
    int cloud = data['cloud'];
    String countryCode = data['countryCode'];
    // print(data['temp'].runtimeType);
    // data['temp']=25;
    // print(data['temp']);
    if(data['temp']>=30){
       image ='summer';
       print('summer');
    }else if(data['temp']<20){
       image = 'winter';
       print('winter');

    }else{
       image = 'spring';
       print('spring');

    }
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: TextButton.icon(
                    onPressed: () async{
                      dynamic result =
                              await Navigator.pushNamed(context, '/chooseLocation');
                      print(result);
                      print(result['location'].runtimeType);
                      setState(() {
                        data = {

                          'location' : result['location'],
                          'coordination' : result['coordination'],
                          'temp' : result['temp'],
                          'timeZone' : result['timeZone'],
                          'description' : result[description],
                          'cloud' : result['cloud'],
                          'countryCode' : result['countryCode'],
                        };
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
                      data['location'],
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
                  '$tempStr°',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 92,
                  ),
                ),
                Text(
                  "Time-zone  :  $timeZone",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                  ),
                ), Text(
                  'Country Code : $countryCode',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '$description',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize:20,
                  ),
                ),
                Text(
                  'Cloud(s) : $cloud',
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
