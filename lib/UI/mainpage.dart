import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String soilType;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    soilType = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FarmCare"),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: DropdownButtonFormField(
                  value: soilType,
                  onSaved: (value) {
                    setState(() {
                      soilType = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      soilType = value;
                    });
                    print(soilType);
                  },
                  items: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
