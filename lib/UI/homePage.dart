import 'package:farmcare/UI/agriculturalScemes.dart';
import 'package:farmcare/UI/feedback.dart';
import 'package:farmcare/UI/goodFarmingPractices.dart';
import 'package:farmcare/UI/informationSources.dart';
import 'package:farmcare/UI/tempHumidLoaderScreen.dart';
import 'package:farmcare/data/formdata.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> options_en = [
    "Crop Recommendations",
    "Information Sources",
    "Good Farming Practices",
    "Agricultural Schemes",
    "Feedback",
    "Sell Crops",
    "User Guide",
  ];
  List<String> options_hi = [
    "अनुशंसित फसल",
    "सूत्रों से मिली जानकारी",
    "अच्छी खेती के तरीके",
    "कृषि योजनाएँ",
    "प्रतिपुष्टि",
    "फसल बेचो",
    "उपयोगकर्ता गाइड",
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("FarmCare"),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isHindi = !isHindi;
              });
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  'हिं',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                    height: 550.0,
                    width: size.width,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: options_en.length,
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
                              isHindi ? "${options_hi[i]}" : "${options_en[i]}",
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
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => InformationSources()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => GoodFarmingPractices()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AgriculturalScemes()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FeedBack()));
        break;
      default:
    }
  }
}
