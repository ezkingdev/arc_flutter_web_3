import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  // Entry point of the Flutter application
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Design - CustomScrollView',  // App title
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Theme with blue as primary color
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scroll Design - CustomScrollView"),  // AppBar title
        ),
        body: CustomScrollView(
          // CustomScrollView allows fine-grained control of scroll behavior
          slivers: [
            SliverAppBar(
              floating: true,  // The AppBar will float above content when scrolled
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Custom ScrollView'),  // Title in the flexible space
              ),
              expandedHeight: 200,  // Height when the AppBar is fully expanded
            ),
            SliverList(
              // SliverList creates a scrollable list using a delegate
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text('Item $index'),  // Display the index of each item
                ),
                childCount: 30,  // 30 items will be created in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}
