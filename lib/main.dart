import 'package:flutter/material.dart';
import 'UI/location.dart';
import 'UI/mainpage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "getLocation",
    routes: {
      "main": (context) => MainPage(),
      "getLocation": (context) => Location(),
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.green,
    ),
  ));
}
