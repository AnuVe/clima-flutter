import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();
    lat = location.lat;
    lon = location.lon;
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$appKey');
    if (response.statusCode == 200) {
      var data = response.body;
      var id = jsonDecode(data)['weather'][0]['id'];
      var temp = jsonDecode(data)['main']['temp'];
      var name = jsonDecode(data)['name'];
      print(id);
      print(temp);
      print(name);
    } else
      print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
