import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset("assets/netflix_logo.png"),
        actions: <Widget>[
          Container(child:
            Icon(FontAwesomeIcons.pen, color: Colors.white, size: 17.0),
            margin: EdgeInsets.only(right: 15.0),
          )
        ],
      ),
      body: Container(
        color: Color(0xFF1C1C1C),
        child: Container(child: Column(
          children: <Widget>[
            Center(child: Text("¿Quién está viendo ahora?", style: TextStyle(color: Colors.white, fontSize: 18.0)))
          ],
        ),
        padding: EdgeInsets.only(top: 20.0),
        )
      )
    );
  }
}

class ProfileCard extends StatelessWidget {

  String _name;
  String _logo;

  ProfileCard(this._name, this._logo);

  @override
  Widget build(BuildContext context) {
    return null;
  }
}