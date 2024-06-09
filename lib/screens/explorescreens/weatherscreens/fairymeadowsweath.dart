import 'package:flutter/material.dart';
import 'package:adventurehub/weather/http_helper.dart';
import 'package:adventurehub/weather/weather.dart';
import 'package:adventurehub/screens/explorescreens/weatherscreens/weatherdisplay.dart';

class FairyWeatherScreen extends StatefulWidget {
  final String lat = "35.3843353";
  final String lon = "74.5022756";
  final String apikey = "cd5e6b7b7de6bfcf84b5e841702a90a6";

  @override
  _FairyWeatherScreenState createState() => _FairyWeatherScreenState();
}

class _FairyWeatherScreenState extends State<FairyWeatherScreen> {
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
        title: Text("Fairy Meadows Weather"),
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

