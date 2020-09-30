import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

const appKey = 'f411919918d57d807fa6bd30d9294ddc';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();
    lat = location.lat;
    lon = location.lon;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$appKey');
    var weatherdata = await networkHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 100,
        ),
      ),*/
        );
  }
}
