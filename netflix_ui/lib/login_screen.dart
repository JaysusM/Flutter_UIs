import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Image.asset("assets/netflix_logo.png"),
          actions: <Widget>[
            Container(
              child:
              Icon(FontAwesomeIcons.pen, color: Colors.white, size: 17.0),
              margin: EdgeInsets.only(right: 15.0),
            )
          ],
        ),
        body: Container(
            color: Color(0xFF1C1C1C),
            child: Container(
              child: Column(
                children: <Widget>[
                  Center(
                      child: Text("Who's Watching?",
                          style:
                          TextStyle(color: Colors.white, fontSize: 18.0))),
                  Container(height: 25.0),
                  Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0.0,
                        children: <Widget>[
                          GestureDetector(child: ProfileCard("Jesús", "assets/profile_pic_1.png", screenWidth),
                          onTap: () {Navigator.of(context).pushNamed("/IndexScreen");}
                          ),
                          ProfileCard("Kids", "assets/profile_pic_kids.png",
                              screenWidth),
                          ProfileCard.addProfile(screenWidth)
                        ],
                      ))
                ],
              ),
              padding: EdgeInsets.only(top: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 70.0),
            )));
  }
}

class ProfileCard extends StatelessWidget {
  String _name;
  String _logo;
  bool _addProfile;
  double _width;
  final double _nameSize = 12.0;

  ProfileCard(this._name, this._logo, double screenWidth)
      :
        this._addProfile = false,
        this._width = screenWidth / 3.5;

  ProfileCard.addProfile(double screenWidth)
      :
        this._addProfile = true,
        this._width = screenWidth / 3.5;

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: <Widget>[
      Container(child: Card(
          child: (!_addProfile) ? Image.asset(_logo, width: _width) : Center(
              child: Icon(
                  Icons.add_circle, color: Colors.white, size: _width * 0.5)),
          elevation: 0.0,
          color: Colors.transparent),
        width: _width,
        height: _width - _nameSize,
        margin: EdgeInsets.only(bottom: 5.0),
      ),
      Text((!_addProfile) ? _name : "Add profile",
          style: TextStyle(color: Colors.white, fontSize: _nameSize))
    ]), width: _width,
      height: _width + 50.0,
    );
  }
}
