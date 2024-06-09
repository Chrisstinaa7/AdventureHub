import 'package:flutter/material.dart';
import 'package:adventurehub/screens/explorescreens/weatherscreens/gilgitweather.dart'; 

class GilgitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gilgit, Pakistan",
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Color.fromARGB(255, 90, 169, 223),
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
                "G2.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 12),
              Image.asset(
                "G3.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                "Gilgit is the capital city of the Gilgit-Baltistan region in Pakistan. It is a major hub for tourism and serves as a gateway to many beautiful valleys and mountains.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Popular Attractions:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 90, 169, 223),
                ),
              ),
              SizedBox(height: 8),
              _buildAttractionRow(Icons.directions_car, "Karakoram Highway"),
              _buildAttractionRow(Icons.nature_people, "Naltar Valley"),
              _buildAttractionRow(Icons.landscape, "Hunza Valley"),
             
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GilgitWeatherScreen()), 
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 90, 169, 223), 
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
        Icon(icon, color: Color.fromARGB(255, 90, 169, 223)),
        SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }
}
