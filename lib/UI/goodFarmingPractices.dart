import 'package:flutter/material.dart';

class GoodFarmingPractices extends StatefulWidget {
  @override
  _GoodFarmingPracticesState createState() => _GoodFarmingPracticesState();
}

class _GoodFarmingPracticesState extends State<GoodFarmingPractices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FarmCare"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Image(
          image: AssetImage('images/goodFarmingPrac.png'),
        ),
      ),
    );
  }
}
