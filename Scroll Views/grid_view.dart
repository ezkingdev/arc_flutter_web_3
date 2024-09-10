import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  // Entry point of the Flutter application
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Design - GridView',  // Title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Theme with blue as the primary color
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scroll Design - GridView"),  // AppBar with title
        ),
        body: GridView.builder(
          // GridView.builder is used for creating a scrollable grid of widgets
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  // Specifies 2 items per row in the grid
          ),
          itemCount: 20,  // Total number of grid items
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(8.0),  // Adds margin around each grid item
              color: Colors.blueAccent,  // Background color for each grid item
              child: Center(
                child: Text(
                  'Item $index',  // Displays the index of the item
                  style: TextStyle(fontSize: 20, color: Colors.white),  // Text styling
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
