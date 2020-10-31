import 'package:farmcare/UI/webview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationSources extends StatefulWidget {
  @override
  _InformationSourcesState createState() => _InformationSourcesState();
}

class _InformationSourcesState extends State<InformationSources> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('FarmCare'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: size.width,
                  child: Text(
                    "Links",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.dmSans(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Container(
                  child: Image(
                    alignment: Alignment.center,
                    height: size.width / 1.6,
                    width: size.width / 1.6,
                    image: AssetImage('images/8400.jpg'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: size.width,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      navigator("https://kvk.icar.gov.in/");
                    },
                    color: Color(0xFFebecf1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Krishi Vigyan Kendra Knowledge Network',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Text(
                          'कृषि विज्ञान केंद्र ज्ञान नेटवर्क',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: size.width,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      navigator(
                          "https://aidea.naarm.org.in/icar-sau-institutes/");
                    },
                    color: Color(0xFFebecf1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ICAR And SAU Institutes',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Text(
                          'ICAR और SAU संस्थान',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: size.width,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      navigator("https://icar.org.in/");
                    },
                    color: Color(0xFFebecf1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Indian Council of Agricultural Research',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Text(
                          'भारतीय कृषि अनुसंधान परिषद',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: size.width,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      navigator("https://agricoop.nic.in/");
                    },
                    color: Color(0xFFebecf1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Indian Council of Agricultural Research',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Text(
                          'भारतीय कृषि अनुसंधान परिषद',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigator(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewPage(url),
      ),
    );
  }
}
