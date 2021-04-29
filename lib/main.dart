import 'package:flutter/material.dart';

// import 'dart:js';
import 'package:world_time/pages/chooseLocation.dart';
import 'package:world_time/pages/homePage.dart';
import 'package:world_time/pages/loadingPage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/homePage': (context) => HomePage(),
      '/chooseLocation': (context) => ChooseLocation(),
    },
  ));
}
