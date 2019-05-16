import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';

class NetflixLoader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NetflixLoaderState();
}

class NetflixLoaderState extends State<NetflixLoader> {
  bool _loaded;

  @override
  void initState() {
    _loaded = false;
    Timer(Duration(seconds: 1, milliseconds: 500), () {
      this.setState(() {
        _loaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_loaded)
        ? LoginScreen()
        : Container(
            child: Stack(
              children: <Widget>[
                Container(color: Colors.black),
                Image.asset("assets/netflix_logo.png",
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width / 1.5),
              ],
              alignment: Alignment.center,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          );
  }
}
