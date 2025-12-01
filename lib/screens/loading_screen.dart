import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData () async{
    var weatherData = await WeatherModel().getLocationWeather();

    pushToNextScreen(LocationScreen(locationWeather: weatherData,));
  }

  void pushToNextScreen(LocationScreen screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(color: Colors.blue, size: 150.0,),
      ),
    );
  }
}
