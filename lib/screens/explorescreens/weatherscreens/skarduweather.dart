import 'package:flutter/material.dart';
import 'package:adventurehub/weather/http_helper.dart';
import 'package:adventurehub/weather/weather.dart';
import 'package:adventurehub/screens/explorescreens/weatherscreens/weatherdisplay.dart';

class SkarduWeatherScreen extends StatefulWidget {
  final String lat = "35.3292593";
  final String lon = "75.3977914";
  final String apikey = "21929917378c0a8beebdd5841dda5bf9";

  @override
  _SkarduWeatherScreenState createState() => _SkarduWeatherScreenState();
}

class _SkarduWeatherScreenState extends State<SkarduWeatherScreen> {
  late Future<Weather> _weatherFuture;
  final HttpHelper _httpHelper = HttpHelper();

  @override
  void initState() {
    super.initState();
    _weatherFuture = _httpHelper.getWeather(widget.lat, widget.lon,widget.apikey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skardu Weather"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder<Weather>(
          future: _weatherFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return WeatherInfoDisplay(weather: snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}

