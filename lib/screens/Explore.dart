import 'package:flutter/material.dart';
import 'package:adventurehub/screens/explorescreens/murreescreen.dart';
import 'package:adventurehub/screens/explorescreens/gilgitscreen.dart';
import 'package:adventurehub/screens/explorescreens/hunza.dart';
import 'package:adventurehub/screens/explorescreens/skarduscreen.dart';
import 'package:adventurehub/screens/explorescreens/fairymeadows.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        backgroundColor: Color.fromARGB(255, 133, 109, 17),
      ),
      body: ListView(
        children: [
          DestinationTile(
            destinationName: "Murree",
            imageUrl: "assets/murree.jpg",
            onTap: () {
              _navigateTo(context, MurreeScreen());
            },
          ),
          DestinationTile(
            destinationName: "Gilgit",
            imageUrl: "assets/gilgit.jpg",
            onTap: () {
              _navigateTo(context, GilgitScreen());
            },
          ),
          DestinationTile(
            destinationName: "Hunza",
            imageUrl: "assets/hunza.jpg",
            onTap: () {
              _navigateTo(context, HunzaScreen());
            },
          ),
          DestinationTile(
            destinationName: "Skardu",
            imageUrl: "assets/skardu.jpg",
            onTap: () {
              _navigateTo(context, SkarduScreen());
            },
          ),
          DestinationTile(
            destinationName: "Fairy Meadows",
            imageUrl: "assets/fairy.jpg",
            onTap: () {
              _navigateTo(context, FairyMeadowsScreen());
            },
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push( //pushes a new route on the navigation stack
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

class DestinationTile extends StatefulWidget {
  final String destinationName;
  final String imageUrl;
  final VoidCallback onTap;

  const DestinationTile({
    required this.destinationName,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  _DestinationTileState createState() => _DestinationTileState();
}

class _DestinationTileState extends State<DestinationTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController( // controls animations
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1, end: 0.9).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _animation,
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 133, 109, 17), width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 133, 109, 17), width: 2),
                  ),
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Center(
                    child: Text(
                      widget.destinationName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 82, 68, 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
