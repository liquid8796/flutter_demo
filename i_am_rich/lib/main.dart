import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.orangeAccent,
          appBar: AppBar(
            title: Text('I Am Rich'),
            backgroundColor: Colors.deepOrangeAccent,
          ),
          body: Center(
            child: Image(
              image: AssetImage('images/img_lights.jpg'),
            ),
          )
      ),
    ),
  );
}
