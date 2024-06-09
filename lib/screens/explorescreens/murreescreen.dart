import 'package:flutter/material.dart';
import 'package:adventurehub/screens/explorescreens/weatherscreens/murreeweather.dart'; 

class MurreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Murree",
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Color.fromARGB(255, 14, 124, 23),
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
                "M2.jpg",
                height: 450,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 12),
              Image.asset(
                "M3.jpg",
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                "Murree is a popular hill station and tourist destination in Pakistan, known for its scenic beauty, pleasant weather, and lush green hills.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Popular Attractions:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 8),
              _buildAttraction("Mall Road", Icons.location_city),
              _buildAttraction("Kashmir Point", Icons.landscape),
              _buildAttraction("Pindi Point", Icons.terrain),
              _buildAttraction("Patriata (New Murree)", Icons.nature),
             
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MurreeWeatherScreen()), 
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, 
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

  Widget _buildAttraction(String attractionName, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          SizedBox(width: 8),
          Text(
            attractionName,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
