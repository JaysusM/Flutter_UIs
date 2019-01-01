import 'package:flutter/material.dart';

Widget TopMenuWidget(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text("Instagram", style: Theme.of(context).textTheme.title),
      ),
      leading: IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
      automaticallyImplyLeading: false,
      elevation: 1.0,
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
    );
}