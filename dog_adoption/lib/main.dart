import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'user.dart';
import 'adopter_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static User _user = User("assets/avatar_1.jpg", "JaysusM");
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'OpenSans'
      ),
      home: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: List.generate(8, (index) {
                return ListTile(
                  title: Text("Option $index"),
                );
              })..insert(0, Container(child: AdopterProfile(_user), height: 55.0, margin: EdgeInsets.only(bottom: 15.0)))
              ..insert(1, Divider(color: Colors.grey.withOpacity(0.2))),
            ),
          ),
          body: MainScreen(_user)
      ),
    );
  }
}
