import 'package:flutter/material.dart';
import 'movie_gallery.dart';

class HomeGallery extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1C1C1C),
      child: ListView(
        padding: EdgeInsets.only(top: 10.0),
        children: <Widget>[
          MovieGallery("Drama"),
          MovieGallery("Horror"),
          MovieGallery("Action"),
          MovieGallery("Animation"),
          MovieGallery("Thriller"),
        ],
      ),
    );
  }

}