import 'package:flutter/material.dart';

class NoteEditScreen extends StatelessWidget {
  final TextEditingController noteController;

  NoteEditScreen({required this.noteController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Trip Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.of(context).pop(noteController.text); 
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: noteController,
          decoration: InputDecoration(hintText: 'Write about your trip'),
          maxLines: null,
        ),
      ),
    );
  }
}
