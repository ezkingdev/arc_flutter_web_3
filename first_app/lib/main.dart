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
      title: 'Doggo Notes', //
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
        appBar: AppBar(
          backgroundColor: Colors.black,
          leadingWidth: 80,
          titleSpacing: 0,
          leading: const Padding(
            padding: EdgeInsets.all(0.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://r2.starryai.com/results/1007335588/8c09e79f-b700-46ac-9ac2-f9a173d55f0e.webp'),
            ),
          ),
          actions: [
            IconButton(
              icon: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(0, 0, 0, 1)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.graph_circle, // Replace with desired icon
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                // Action to be performed on icon press
              },
            ),
          ],

        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
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
