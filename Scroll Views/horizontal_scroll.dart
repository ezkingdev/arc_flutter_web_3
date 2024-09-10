import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  // Entry point of the Flutter application
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal Scroll View',  // App title
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Set theme with blue as primary color
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Horizontal Scroll - SingleChildScrollView"),  // AppBar title
        ),
        body: SingleChildScrollView(
          // Enables horizontal scrolling for the child widgets
          scrollDirection: Axis.horizontal,
          child: Row(
            // Creates a row with 10 horizontally scrollable containers
            children: List.generate(
              10,  // Generates 10 items in the row
              (index) => Container(
                width: 150,  // Fixed width for each scrollable item
                height: 150,  // Fixed height for each scrollable item
                margin: EdgeInsets.all(8.0),  // Adds margin around each item
                color: Colors.blueAccent,  // Background color for each item
                child: Center(
                  child: Text(
                    'Item $index',  // Display the index of the item
                    style: TextStyle(fontSize: 20, color: Colors.white),  // Text style
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
