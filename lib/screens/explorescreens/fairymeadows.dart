import 'package:flutter/material.dart';
import 'package:adventurehub/screens/explorescreens/weatherscreens/fairymeadowsweath.dart';

class FairyMeadowsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fairy Meadows",
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Color.fromARGB(255, 235, 119, 158),
        iconTheme: IconThemeData(color: Colors.white), 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 12),
              
              Image.asset(
                "F1.jpg",
                height: 500, 
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 12),
             
              Image.asset(
                "F2.jpg",
                height: 400, 
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                "Fairy Meadows is a picturesque meadow near the base of Nanga Parbat, the ninth-highest mountain in the world. It offers stunning views of the mountain and is a popular camping and trekking spot.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Popular Attractions:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 236, 90, 139), 
                ),
              ),
              SizedBox(height: 8),
              
              _buildAttractionRow(Icons.directions, "Nanga Parbat Base Camp"),
              _buildAttractionRow(Icons.nature, "Camping under the stars"),
              _buildAttractionRow(Icons.directions_walk, "Hiking trails"),
              
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FairyWeatherScreen()), 
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 236, 90, 139), 
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
          color: const Color.fromARGB(255, 236, 90, 139),
        ),
        SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
