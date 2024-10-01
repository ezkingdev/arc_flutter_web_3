import 'package:flutter/cupertino.dart';
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
          leading: Icon(Icons.grid_3x3_rounded, size: 20,),
          title: Text('Flutter Layouts'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Stack (
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 40.0,
                  height: MediaQuery.of(context).size.height * 0.25,
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.heart_broken, size: 24.0, color: Colors.white,),
                      Icon(Icons.star, size: 24.0, color: Colors.white,),
                      Icon(Icons.bookmark, size: 24.0, color: Colors.white,),
                      Icon(Icons.comment_bank_rounded, size: 24.0, color: Colors.white,),
                      Icon(Icons.more_horiz, size: 24.0, color: Colors.white,),
                    ],
                  )
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}