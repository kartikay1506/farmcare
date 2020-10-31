import 'package:farmcare/data/formdata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CropDetails extends StatefulWidget {
  final int index;
  CropDetails(
    this.index,
  );
  @override
  _CropDetailsState createState() => _CropDetailsState();
}

class _CropDetailsState extends State<CropDetails> {
  String key;
  String getIndex(int i) {
    return indexes[i];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int index = widget.index;
    return Scaffold(
      // backgroundColor: Color(0xFFebecf1),
      appBar: AppBar(
        title: Text("FarmCare"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Container(
              height: 55.0,
              width: size.width,
              margin: EdgeInsets.all(20.0),
              child: Text(
                "${result['crops']['$index'][0].toUpperCase()}${result['crops']['$index'].substring(1)}",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Card(
              color: Color(0xFFebecf1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.all(10.0),
              elevation: 3.0,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      // border: Border.all(
                      //   color: Colors.green,
                      // ),
                      shape: BoxShape.circle,
                    ),
                    child: Card(
                      elevation: 7.0,
                      margin: EdgeInsets.all(0.0),
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        radius: size.width / 5,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage("${images[index]}"),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.all(20.0),
                    child: Text(
                      "${result['crop_info']['$index'][0].toUpperCase()}${result['crop_info']['$index'].substring(1)}",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.dmSans(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Container(
              height: 630.0,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                scrollDirection: Axis.vertical,
                itemCount: result.length - 2,
                itemBuilder: (context, i) => Container(
                  margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xFFebecf1),
                    child: new GridTile(
                      child: Center(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${titleData[i]}",
                                style: GoogleFonts.dmSans(
                                  fontSize: 18.0,
                                  color: Colors.green,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(padding: EdgeInsets.only(top: 10.0)),
                              Text(
                                "${result[getIndex(i)]['$index']}",
                                style: GoogleFonts.dmSans(
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
