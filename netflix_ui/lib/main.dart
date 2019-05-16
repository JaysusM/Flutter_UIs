import 'package:flutter/material.dart';
import 'netflix_loader.dart';
import 'index_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      home: NetflixLoader(),
      routes: <String, WidgetBuilder>{
        "/IndexScreen": (BuildContext context) => IndexScreen()
      }
    );
  }
}