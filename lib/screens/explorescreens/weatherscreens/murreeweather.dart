import 'package:flutter/material.dart';
import 'package:adventurehub/weather/http_helper.dart';
import 'package:adventurehub/weather/weather.dart';
import 'package:adventurehub/screens/explorescreens/weatherscreens/weatherdisplay.dart';

class MurreeWeatherScreen extends StatefulWidget {
  final String lat = "33.8996";
  final String lon = "73.4182";
  final String apikey = "605140a368a65d668a4e8afd8fb91481";

  @override
  _MurreeWeatherScreenState createState() => _MurreeWeatherScreenState();
}

class _MurreeWeatherScreenState extends State<MurreeWeatherScreen> {
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
        title: Text("Murree Weather"),
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

