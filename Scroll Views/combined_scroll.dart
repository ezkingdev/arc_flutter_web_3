import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  // Entry point of the application, launching MyApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal Scroll and Grid',  // App title
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Theme with primary color as blue
      ),
      home: HomePage(),  // Set HomePage as the default screen
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll and Grid with Bottom Navigation"),  // AppBar title
      ),
      body: SingleChildScrollView(
        // Enables vertical scrolling for the entire page
        child: Column(
          children: [
            // Horizontal Scroll Section
            Container(
              height: 150,  // Fixed height for the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,  // Horizontal scrolling
                itemCount: 10,  // 10 horizontally scrollable items
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,  // Fixed width for each item
                    margin: EdgeInsets.all(8.0),  // Margin around each item
                    color: Colors.blueAccent,  // Background color for items
                    child: Center(
                      child: Text(
                        'Item $index',  // Display item index
                        style: TextStyle(fontSize: 20, color: Colors.white),  // Text style
                      ),
                    ),
                  );
                },
              ),
            ),
            // Grid Section
            Padding(
              padding: const EdgeInsets.all(8.0),  // Padding around the grid
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),  // Disable GridView's own scroll
                shrinkWrap: true,  // Let GridView take only as much space as needed
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,  // 2 grid items per row
                  crossAxisSpacing: 8.0,  // Space between columns
                  mainAxisSpacing: 8.0,  // Space between rows
                  childAspectRatio: 1,  // Square-shaped grid items
                ),
                itemCount: 20,  // 20 items in the grid
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.greenAccent,  // Background color for grid items
                    child: Center(
                      child: Text(
                        'Grid Item $index',  // Display item index in grid
                        style: TextStyle(fontSize: 18),  // Text style for grid items
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),  // Icon for Home tab
            label: 'Home',  // Label for Home tab
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),  // Icon for Search tab
            label: 'Search',  // Label for Search tab
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),  // Icon for Profile tab
            label: 'Profile',  // Label for Profile tab
          ),
        ],
        currentIndex: 0,  // Default selected item is the first (Home)
        onTap: (index) {
          // Placeholder for tap event, currently non-functional
        },
      ),
    );
  }
}
