import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  var location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FarmCare"),
      ),
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Location",
                ),
                onChanged: (value) {
                  location = value;
                },
              ),
              RaisedButton(
                onPressed: () {
                  print(location);
                },
                child: Text("Enter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
