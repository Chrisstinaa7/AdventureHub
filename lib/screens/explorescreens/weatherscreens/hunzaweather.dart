import 'package:flutter/material.dart';
import 'package:adventurehub/weather/http_helper.dart';
import 'package:adventurehub/weather/weather.dart';
import 'package:adventurehub/screens/explorescreens/weatherscreens/weatherdisplay.dart';

class HunzaWeatherScreen extends StatefulWidget {
  final String lat = "36.3103106";
  final String lon = "74.6493444";
  final String apikey = "3450619e28d0fec5dc7948e70d5dad10";

  @override
  _HunzaWeatherScreenState createState() => _HunzaWeatherScreenState();
}

class _HunzaWeatherScreenState extends State<HunzaWeatherScreen> {
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
        title: Text("Hunza Weather"),
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

