import 'package:flutter/material.dart';
import 'package:adventurehub/screens/explorescreens/weatherscreens/hunzaweather.dart';

class HunzaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hunza, Pakistan",
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Color.fromARGB(255, 133, 109, 17),
        iconTheme: IconThemeData(
            color: Colors.white), 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           
              SizedBox(height: 16),
              
              Image.asset(
                "H1.jpg",
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 12),
              Image.asset(
                "H3.jpg",
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                "Hunza Valley is a mountainous valley in the Gilgit-Baltistan region of Pakistan. It is known for its breathtaking landscapes, high peaks, and vibrant culture.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Popular Attractions:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 196, 105, 63),
                ),
              ),

              SizedBox(height: 8),
              _buildAttractionRow(Icons.account_balance, "Altit Fort"),
              _buildAttractionRow(Icons.account_balance, "Baltit Fort"),
              _buildAttractionRow(Icons.water, "Attabad Lake"),
              _buildAttractionRow(Icons.terrain, "Passu Cones"),

              
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HunzaWeatherScreen()), 
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 196, 105, 63), 
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
          color: const Color.fromARGB(255, 196, 105, 63),
        ),
        SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
