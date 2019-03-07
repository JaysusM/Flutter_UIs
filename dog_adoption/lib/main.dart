import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'OpenSans'
      ),
      home: Material(
          child: SearchScreen(new User("assets/avatar_1.jpg", "JaysusM"))
      ),
    );
  }
}
