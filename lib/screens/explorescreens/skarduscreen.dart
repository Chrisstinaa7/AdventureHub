import 'package:flutter/material.dart';
import 'package:adventurehub/screens/explorescreens/weatherscreens/skarduweather.dart';

class SkarduScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Skardu, Pakistan",
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Color.fromARGB(255, 68, 69, 150),
        iconTheme: IconThemeData(
            color: Colors.white), 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              SizedBox(height: 14),
              
              Image.asset(
                "S2.jpg",
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 12),
              // Second Image
              Image.asset(
                "S1.jpg",
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 12),
              // Third Image
              Image.asset(
                "S3.jpg",
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                "Skardu is a town in Gilgit-Baltistan region of Pakistan. It serves as a base for trekking and mountaineering expeditions to some of the highest peaks in the world.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Popular Attractions:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 43, 109, 253),
                ),
              ),
              SizedBox(height: 8),

              _buildAttractionRow(Icons.hotel, "Shangrila Resort"),
              _buildAttractionRow(Icons.water, "Upper Kachura Lake"),
              _buildAttractionRow(Icons.account_balance, "Shigar Fort"),
              _buildAttractionRow(Icons.water, "Satpara Lake"),

              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SkarduWeatherScreen()), 
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 43, 109, 253), 
                  ),
                  child: Text(
                    'Check Weather',
                    style: TextStyle(
                      color: Colors.white, 
                    ),
                  ), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttractionRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color.fromARGB(255, 43, 109, 253),
        ),
        SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
