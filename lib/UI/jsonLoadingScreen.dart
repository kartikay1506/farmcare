import 'dart:async';
import 'package:farmcare/UI/ourSuggestionsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JsonLoadingScreen extends StatefulWidget {
  @override
  _JsonLoadingScreenState createState() => _JsonLoadingScreenState();
}

class _JsonLoadingScreenState extends State<JsonLoadingScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    getData();
  }

  getData() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
        navigateToNextScreen();
      });
    });
  }

  navigateToNextScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OurSuggestionsScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FarmCare'),
      ),
      body: Center(
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(
                    radius: 15.0,
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Text(
                    'Fetching data',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              )
            : Container(),
      ),
    );
  }
}
