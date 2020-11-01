import 'package:farmcare/data/formdata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("FarmDetails"),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.all(15.0),
        width: size.width,
        height: 55.0,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.green,
          child: Text(
            isHindi ? "आगे जाएं" : "Submit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          onPressed: () {
            validator();
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: size.height,
          margin: EdgeInsets.only(bottom: 0.0),
          child: Center(
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Card(
                      color: Color(0xFFebecf1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'Were the suggestions helpful ?',
                              style: GoogleFonts.dmSans(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.0)),
                            TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                labelText: "Your Answer",
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.limeAccent[700],
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.limeAccent[700],
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "This field is mandatory";
                                }
                              },
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Card(
                      color: Color(0xFFebecf1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'How can we improve ?',
                              style: GoogleFonts.dmSans(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.0)),
                            TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                labelText: "Your Answer",
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.limeAccent[700],
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.limeAccent[700],
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "This field is mandatory";
                                }
                              },
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Card(
                      color: Color(0xFFebecf1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'Did you find any data inconsistency.  Please tell us the correct data.',
                              style: GoogleFonts.dmSans(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.0)),
                            TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                labelText: "Your Answer",
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.limeAccent[700],
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.limeAccent[700],
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "This field is mandatory";
                                }
                              },
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  validator() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      Navigator.pop(context);
      //navigateToNextScreen();
    }
  }
}
