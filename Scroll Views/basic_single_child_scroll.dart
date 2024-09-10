import 'package:flutter/material.dart';

/// Entry point of the Flutter application
void main() {
  runApp(MyApp());
}

/// Main application widget, which extends StatelessWidget
/// It sets up the basic structure of the app.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Design', // The title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the theme with a blue color scheme
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scroll Design - SingleChildScrollView"), // AppBar title
        ),
        body: SingleChildScrollView(
          // Enables vertical scrolling for its child
          child: Column(
            // Column widget contains a list of children generated dynamically
            children: List.generate(
              20, // Generate 20 items
              (index) => Container(
                margin: EdgeInsets.all(8.0), // Space around each container
                padding: EdgeInsets.all(20.0), // Padding inside each container
                color: Colors.blueAccent, // Background color of the container
                child: Text(
                  'Item $index', // Text displaying item index
                  style: TextStyle(fontSize: 20, color: Colors.white), // Text styling
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
