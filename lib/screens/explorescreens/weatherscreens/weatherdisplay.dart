import 'package:flutter/material.dart';
import 'package:adventurehub/weather/weather.dart';

class WeatherInfoDisplay extends StatelessWidget {
  final Weather weather;

  const WeatherInfoDisplay({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/weather.jpg', 
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4), 
            borderRadius: BorderRadius.circular(10),
            
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weather in ${weather.cityName}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                  _buildWeatherInfoItem(
                    icon: Icons.cloud_circle,
                    label: "Cloud Cover",
                    value: "${weather.cloudCover}%",
                  ),
                   _buildWeatherInfoItem(
                    icon: Icons.cloud,
                    label: "Description",
                    value: weather.description,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildWeatherInfoItem(
                    icon: Icons.air,
                    label: "Wind Speed",
                    value: "${weather.windSpeed} m/s",
                  ),
                 
                  

                
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                   _buildWeatherInfoItem(
                    icon: Icons.opacity,
                    label: "Humidity",
                    value: "${weather.humidity}%",
                  ),

                
                ],
              ),
              
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   _buildWeatherInfoItem(
                    icon: Icons.thermostat,
                    label: "Temperature",
                    value: "${weather.temperature}°C",
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.blue,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
