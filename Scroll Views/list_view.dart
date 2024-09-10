import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  // Entry point of the Flutter application
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Design - ListView',  // App title
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Set the theme with a blue color scheme
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scroll Design - ListView"),  // AppBar title
        ),
        body: ListView.builder(
          // ListView.builder is used to create a scrollable list of items
          itemCount: 50,  // Creates 50 items in the list
          itemBuilder: (context, index) {
            return ListTile(
              // ListTile is a common pattern used for displaying list items
              title: Text('Item $index'),  // The title of each list item
              subtitle: Text('Subtitle of item $index'),  // Subtitle of the item
              leading: Icon(Icons.label),  // Leading icon before the text
            );
          },
        ),
      ),
    );
  }
}
