import 'package:farmcare/UI/webview.dart';
import 'package:farmcare/data/formdata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgriculturalScemes extends StatefulWidget {
  @override
  _AgriculturalScemesState createState() => _AgriculturalScemesState();
}

class _AgriculturalScemesState extends State<AgriculturalScemes> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('FarmCare'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          width: size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: size.width,
                  child: Text(
                    "Agricultural Scemes",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.dmSans(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Container(
                  height: 850.0,
                  width: size.width,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: agriculturalScemesURL.length,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.all(10.0),
                      width: size.width,
                      height: 100.0,
                      child: MaterialButton(
                        onPressed: () {
                          navigator("${agriculturalScemesURL[index]}");
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
                              '${agriculturalScemes_en[index]}',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.0)),
                            Text(
                              '${agriculturalScemes_hi[index]}',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
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
