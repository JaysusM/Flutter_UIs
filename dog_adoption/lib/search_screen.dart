import 'package:flutter/material.dart';
import 'adopter_profile.dart';
import 'user.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class SearchScreen extends StatelessWidget {
  User _loggedUser;

  SearchScreen(this._loggedUser);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
              child: AdopterProfile(_loggedUser),
              height: 60.0,
              width: MediaQuery.of(context).size.width),
          Container(height: 20.0),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 80.0,
              child: locationSearcher()),
          Container(height: 30.0),
          Container(
            margin: EdgeInsets.only(left: 30.0, right: 30.0),
            height: 2.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
    ));
  }

  Widget locationSearcher() {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 5.0,
            left: 70.0,
            child: Text("Location",
                style: TextStyle(color: Colors.grey, fontSize: 15.0))),
        Positioned(
            top: 35.0,
            left: 68.5,
            child: Row(
              children: <Widget>[
                Text("Luisville,",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700)),
                Text(" KY",
                    style: TextStyle(color: Colors.black, fontSize: 35.0)),
              ],
            )),
        Positioned(
          top: 47.0,
          left: 22.0,
          child: Icon(OMIcons.addLocation, size: 27.0, color: Colors.black),
        )
      ],
    );
  }
}
