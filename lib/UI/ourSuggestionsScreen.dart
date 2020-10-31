import 'package:farmcare/UI/cropDetails.dart';
import 'package:farmcare/data/formdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OurSuggestionsScreen extends StatefulWidget {
  @override
  _OurSuggestionsScreenState createState() => _OurSuggestionsScreenState();
}

class _OurSuggestionsScreenState extends State<OurSuggestionsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("FarmCare"),
      ),
      body: Container(
        padding: EdgeInsets.all(7.0),
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 55.0,
                width: size.width,
                margin: EdgeInsets.all(10.0),
                child: Text(
                  "Our Suggestions",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.dmSans(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Container(
                height: 240.0 * result['crops'].length,
                width: size.width,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: result['crops'].length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.all(10.0),
                    height: 200.0,
                    width: size.width,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CropDetails(index),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 10.0,
                        margin: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width / 2 - 20.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(0.0),
                                      margin:
                                          EdgeInsets.fromLTRB(20, 40, 10, 10),
                                      // color: Colors.red,
                                      child: Text(
                                        "${result['crops']['$index'][0].toUpperCase()}${result['crops']['$index'].substring(1)}",
                                        style: GoogleFonts.dmSans(
                                          fontSize: 30.0,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(80.0),
                                  bottomLeft: Radius.circular(80.0),
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                // color: Colors.green,
                              ),
                              width: size.width / 2 - 20.0,
                              child: Image(
                                image: NetworkImage(
                                  "${images[index]}",
                                ),
                                filterQuality: FilterQuality.medium,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CupertinoActivityIndicator(),
                                  );
                                },
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
