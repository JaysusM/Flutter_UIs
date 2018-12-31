import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(
              fontFamily: 'Instagram',
              fontSize: 30.0
          ),
          subtitle: TextStyle(
              fontFamily: 'Regular',
            fontSize: 10.0
          )
        )
      ),
    )
);