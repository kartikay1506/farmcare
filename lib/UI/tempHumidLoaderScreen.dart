import 'dart:convert';

import 'package:farmcare/UI/mainpage.dart';
import 'package:farmcare/data/formdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TempHumidLoaderScreen extends StatefulWidget {
  @override
  _TempHumidLoaderScreenState createState() => _TempHumidLoaderScreenState();
}

class _TempHumidLoaderScreenState extends State<TempHumidLoaderScreen> {
  bool isLoading = true;
  var url;
  void initState() {
    super.initState();

    url =
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=cd1b1ab918ac58e92920f2eb06f18399";
    getSeason();
    getDataTempHumid();
  }

  getSeason() {
    season = "";
    var month = DateTime.now().month;
    if (month >= 7 && month <= 10) {
      season = "Kharif";
    } else if ((month >= 10 && month <= 12) || (month >= 1 && month <= 4)) {
      season = "Rabi";
    } else {
      season = "Zaid";
    }
  }

  Future getDataTempHumid() async {
    temp = "";
    humidity = "";
    var response = await http.get(url);
    var tempHumidData = json.decode(response.body);
    temp = tempHumidData["main"]["temp"];
    temp = ((temp - 273) * (9 / 5) + 32).toString();
    humidity = tempHumidData["main"]["humidity"].toString();
    formating();
    navigateToNextScreen();
  }

  formating() {
    var index = temp.toString().lastIndexOf(".");
    temp = temp.toString().substring(0, index + 2);
  }

  navigateToNextScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FarmCare'),
      ),
      body: Center(
        child: CupertinoActivityIndicator(
          radius: 15.0,
        ),
      ),
    );
  }
}
