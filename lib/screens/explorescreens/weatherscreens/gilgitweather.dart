import 'package:flutter/material.dart';
import 'package:adventurehub/weather/http_helper.dart';
import 'package:adventurehub/weather/weather.dart';
import 'package:adventurehub/screens/explorescreens/weatherscreens/weatherdisplay.dart';

class GilgitWeatherScreen extends StatefulWidget {
  final String lat = "35.9198322";
  final String lon = "74.3087796";
  final String apikey = "f642eb7f46f9ace823766187759865f5";

  @override
  _GilgitWeatherScreenState createState() => _GilgitWeatherScreenState();
}

class _GilgitWeatherScreenState extends State<GilgitWeatherScreen> {
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
        title: Text("Gilgit Weather"),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/G1.jpg', // Replace with your image asset path
              fit: BoxFit.cover,
            ),
          ),
          Center(
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
        ],
      ),
    );
  }
}
