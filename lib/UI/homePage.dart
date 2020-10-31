import 'package:farmcare/UI/mainpage.dart';
import 'package:farmcare/UI/tempHumidLoaderScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> options = [
    "Crop Recommendations",
    "Information Sources",
    "Good Farming Practices",
    "Agricultural Schemes",
    "Feedback",
    "User's Guide",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("FarmCare"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image(
                    alignment: Alignment.center,
                    height: size.width / 1.6,
                    width: size.width / 1.6,
                    image: AssetImage('images/homePage.png'),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(7.0),
                    height: 480.0,
                    width: size.width,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: options.length,
                      itemBuilder: (context, i) => Center(
                        child: Container(
                          height: 55.0,
                          width: size.width,
                          margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          child: MaterialButton(
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              "${options[i]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            color: Colors.green,
                            onPressed: () {
                              navigateToNextScreen(i);
                            },
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigateToNextScreen(int i) {
    switch (i) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TempHumidLoaderScreen()));
        break;
      default:
    }
  }
}
