import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  double longitude;
//this function should be builded after the build function of our state 
  void initState() {
    super.initState();
    getLocationData();
  }

/* void getlocation()async {
  Location location = Location();
  await location.getCurrentLocation();
  print (location.latitude);
  print('location.longtitude);
}*/
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
// to make the connection between screens 
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
