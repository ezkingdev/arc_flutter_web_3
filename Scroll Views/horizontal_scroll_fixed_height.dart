import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  // Entry point of the Flutter application
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal Scroll View with Fixed Height',  // App title
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Set the theme with a blue color scheme
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Horizontal Scroll - Fixed Height"),  // AppBar with title
        ),
        body: Container(
          height: 200,  // Fixed height for the scrollable area
          child: SingleChildScrollView(
            // Enables horizontal scrolling
            scrollDirection: Axis.horizontal,
            child: Row(
              // Creates 10 child items in the row
              children: List.generate(
                10,  // Generates 10 items in the scrollable row
                (index) => Container(
                  width: 150,  // Fixed width for each scrollable item
                  margin: EdgeInsets.all(8.0),  // Margin around each item
                  color: Colors.blueAccent,  // Background color for each item
                  child: Center(
                    child: Text(
                      'Item $index',  // Text displaying the item index
                      style: TextStyle(fontSize: 20, color: Colors.white),  // Text style
                    ),
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
