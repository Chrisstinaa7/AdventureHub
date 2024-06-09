import 'package:flutter/material.dart';
import 'package:adventurehub/screens/Notescreen.dart';

class FavoriteDestination {
  String name;
  bool visited;
  String note;

  FavoriteDestination(
      {required this.name, this.visited = false, this.note = ''});
}

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<FavoriteDestination> favoriteDestinations = [
    FavoriteDestination(name: 'Murree', visited: false),
    FavoriteDestination(name: 'Hunza', visited: false),
    FavoriteDestination(name: 'Skardu', visited: false),
    FavoriteDestination(name: 'Gilgit', visited: false),
    FavoriteDestination(name: 'Fairy Meadows', visited: false),
  ];

  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  Future<void> _addDestinationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Favorite Destination'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _destinationController,
                decoration: InputDecoration(hintText: 'Destination Name'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add'),
              onPressed: () {
                String destinationName = _destinationController.text;
                if (destinationName.isNotEmpty) {
                  setState(() {
                    favoriteDestinations.add(
                      FavoriteDestination(name: destinationName),
                    );
                  });
                  _destinationController.clear();
                  Navigator.of(context).pop();
                }
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                _destinationController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/explore.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: ListView.builder(
          //to build list on addition of new item
          itemCount: favoriteDestinations.length,
          itemBuilder: (context, index) {
            final destination = favoriteDestinations[index];
            return Dismissible(
              key: Key(destination.name),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  favoriteDestinations.removeAt(index);
                });
              },
              child: ListTile(
                title: Text(
                  destination.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                trailing: destination.visited
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showNoteField(context, destination);
                            },
                            child: Icon(Icons.note_add),
                          ),
                          SizedBox(width: 8.0),
                          Icon(Icons.check_circle,
                              color: Color.fromARGB(255, 133, 109, 17)),
                        ],
                      )
                    : Icon(Icons.radio_button_unchecked),
                onTap: () {
                  setState(() {
                    destination.visited =
                        !destination.visited; //for when radiobutton is clicked
                  });
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addDestinationDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showNoteField(
      BuildContext context, FavoriteDestination destination) async {
    //navigate to notecontroller
    _noteController.text = destination.note;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteEditScreen(noteController: _noteController),
      ),
    );

    setState(() {
      destination.note = _noteController.text;
    });
  }
}
