import 'package:flutter/material.dart';
import 'user.dart';

class AdopterProfile extends StatelessWidget {
  User _user;

  AdopterProfile(this._user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(child: ClipOval(child: new Image.asset(_user.avatarURL, width: 35.0, height: 35.0, fit: BoxFit.fitHeight)), left: 20.0, top: 20.0,),
        Positioned(child: Text(_user.username, style: TextStyle(fontSize: 17.5, color: Colors.black, fontWeight: FontWeight.w700)), left: 70.0, top: 27.0)
      ],
    );
  }
}
