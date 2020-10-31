import 'package:farmcare/UI/jsonLoadingScreen.dart';
import 'package:flutter/material.dart';
import 'UI/location.dart';
import 'UI/mainpage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "getLocation",
    routes: {
      "main": (context) => MainPage(),
      "getLocation": (context) => Location(),
      "/": (context) => JsonLoadingScreen(),
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.green,
    ),
  ));
}
