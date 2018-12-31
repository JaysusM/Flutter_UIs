import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Instagram", style: Theme.of(context).textTheme.title),
        ),
        leading: IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: <Widget>[
          Transform(
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
            transform: Matrix4.rotationZ(-44.65),
            alignment: FractionalOffset.center,
          )
        ],
        bottom: PreferredSize(
          child: Container(
            height: 2.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
