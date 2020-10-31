import 'package:farmcare/data/formdata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CropDetails extends StatefulWidget {
  int index;
  CropDetails(
    this.index,
  );
  @override
  _CropDetailsState createState() => _CropDetailsState();
}

class _CropDetailsState extends State<CropDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int index = widget.index;
    return Scaffold(
      appBar: AppBar(
        title: Text("FarmCare"),
      ),
      body: Column(
        children: [
          Container(
            height: 55.0,
            width: size.width,
            margin: EdgeInsets.all(20.0),
            child: Text(
              "${result['crops']['$index'][0].toUpperCase()}${result['crops']['$index'].substring(1)}",
              textAlign: TextAlign.left,
              style: GoogleFonts.dmSans(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),
          CircleAvatar(
            minRadius: size.width / 2.5,
            maxRadius: size.width / 2,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage("${images[index]}"),
          ),
        ],
      ),
    );
  }
}
