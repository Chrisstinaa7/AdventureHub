import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About us'),
        backgroundColor: Color.fromARGB(255, 148, 122, 20),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                'assets/front.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _animatedTile(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('AdventureHub', Icons.info),
                        _sectionDescription(
                          'Your ultimate companion for exploring Pakistan!',
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  _animatedTile(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Explore', Icons.explore),
                        _sectionDescription(
                          'Discover destinations like Murree, Hunza, and Skardu with weather info.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  _animatedTile(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Favorites', Icons.favorite),
                        _sectionDescription(
                          'Keep track of your favorite spots and memories.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  _animatedTile(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Budget', Icons.monetization_on),
                        _sectionDescription(
                          'Manage your finances with our budget planner.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  _animatedTile(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Plans', Icons.calendar_today),
                        _sectionDescription(
                          'Plan your future adventures.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _bottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      color: Color.fromARGB(255, 148, 122, 20),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AdventureHub - Your Gateway to Adventure',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Icon(Icons.email, color: Colors.black87, size: 20.0),
              SizedBox(width: 8.0),
              Text(
                'support@adventurehub.com',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.black87, size: 20.0),
              SizedBox(width: 8.0),
              Text(
                '+1 (123) 456-7890',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _animatedTile(Widget child) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
          color: Color.fromARGB(150, 231, 210, 124),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black)),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color.fromARGB(255, 82, 68, 14),
            size: 24.0,
          ),
          SizedBox(width: 8.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 82, 68, 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionDescription(String description) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Text(
        description,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
