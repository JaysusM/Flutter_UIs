import 'package:flutter/material.dart';

class MovieGallery extends StatelessWidget {

  String _title;

  MovieGallery(this._title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(child: Align(child: Text(_title, style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold)), alignment: Alignment.topLeft), padding: EdgeInsets.only(left: 15.0)),
        Container(child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            moviePoster("assets/endgame.jpg"),
            moviePoster("assets/endgame.jpg"),
            moviePoster("assets/endgame.jpg"),
            moviePoster("assets/endgame.jpg"),
            moviePoster("assets/endgame.jpg"),
            moviePoster("assets/endgame.jpg"),
          ],
          padding: EdgeInsets.only(left: 15.0),
        ),
        height: 200.0,
        )
      ],
    );
  }

  static Widget moviePoster(String posterAsset) {
    return Container(child: Image.asset(posterAsset, width: 120.0, height: 200.0, fit: BoxFit.contain), padding: EdgeInsets.only(right: 15.0));
  }

}