import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'notes_widget.dart';
import 'create_note_widget.dart';

void main() {
  runApp(const MyApp()); // Entry point of the Flutter application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal Scroll View', // App title
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set theme with blue as primary color
      ),
      home: const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Stack(
            children: [
              NotesWidget(),
              CreateNoteWidget(),
            ],
          ),

        ),
      ),
    );
  }
}
