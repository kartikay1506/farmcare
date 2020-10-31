import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import '../data/formdata.dart';
import 'homePage.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool locationEnabled = false;
  Position _currentLocation;
  bool isLoading = true;
  Address first;

  //These variables are for the logic of permission allow and deny
  bool settings = false;

  @override
  void initState() {
    super.initState();
    longitude = "";
    latitude = "";
    finaladdress = "";
    isLoading = true;
    checkAllowLocation();
  }

  checkAllowLocation() async {
    longitude = "";
    latitude = "";
    finaladdress = "";
    LocationPermission checkpermission = await Geolocator.checkPermission();
    String val = checkpermission.toString();
    print(checkpermission.toString());
    if (val == "LocationPermission.whileInUse" ||
        val == "LocationPermission.always") {
      setState(() {
        locationEnabled = true;
        _getCurrentLocation();
      });
    } else {
      if (settings == true) {
        await Geolocator.openAppSettings();
      } else {
        LocationPermission permission = await Geolocator.requestPermission();
        print(permission.index);
        if (permission.index == 1) {
          settings = true;
        }
        checkpermission = await Geolocator.checkPermission();
        val = checkpermission.toString();
        if (val == "LocationPermission.whileInUse" ||
            val == "LocationPermission.always") {
          setState(() {
            locationEnabled = true;
            _getCurrentLocation();
          });
        } else {
          setState(() {
            locationEnabled = false;
            isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          margin: EdgeInsets.all(15.0),
          width: size.width,
          height: 55.0,
          child: !isLoading && locationEnabled
              ? MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                )
              : Container(),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                checkAllowLocation();
              },
            ),
          ],
          title: Text("FarmCare"),
        ),
        body: Center(
          child: isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(
                      radius: 15.0,
                    ),
                    Padding(padding: EdgeInsets.only(top: 40.0)),
                    Text(
                      'Your current location is being fetched',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                )
              : locationEnabled
                  ? Container(
                      height: size.height,
                      margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 60.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 32.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${first.addressLine}",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Image(
                            alignment: Alignment.center,
                            height: size.width / 1.3,
                            width: size.width / 1.3,
                            image: AssetImage('images/locationScreen.png'),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Location Service is not enable, Please give the required permissions to proceed",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            'Allow',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.green,
                          onPressed: () {
                            checkAllowLocation();
                          },
                        )
                      ],
                    ),
        ),
      ),
    );
  }

  _getAddressFromLatLng() async {
    var coordinates =
        new Coordinates(_currentLocation.latitude, _currentLocation.longitude);

    try {
      List<Address> address =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      first = address.first;
    } catch (e) {
      errorNotification(e);
    }
    setState(() {
      longitude = _currentLocation.longitude.toString();
      latitude = _currentLocation.latitude.toString();
      finaladdress = first.addressLine;
      isLoading = false;
    });
  }

  _getCurrentLocation() {
    try {
      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true,
      ).then((Position position) {
        setState(() {
          _currentLocation = position;
          _getAddressFromLatLng();
        });
      }).catchError((e) {
        errorNotification('Oops! An error occured');
      });
    } catch (e) {
      errorNotification(e);
    }
  }

  errorNotification(String message) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text(
            "$message",
            style: TextStyle(
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
          content: Icon(
            Icons.location_off,
            color: Colors.red,
          ),
          actions: <Widget>[
            Container(
              child: FlatButton(
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  checkAllowLocation();
                },
              ),
            )
          ],
        );
      },
    );
  }
}
