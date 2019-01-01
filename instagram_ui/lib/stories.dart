import 'package:flutter/material.dart';

class ScrollableStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          OwnStory("assets/rami_malek.jpg"),
          Story("assets/lebron.jpg", "GOAT", true),
          Story("assets/rami_malek.jpg", "Mr.Robot", true),
          Story("assets/rami_malek.jpg", "RamiMalek", false),
          Story("assets/rami_malek.jpg", "RamiMalek2", false),
          Story("assets/rami_malek.jpg", "RamiMalek3", false),
          Story("assets/rami_malek.jpg", "RamiMalek4", false),
          Story("assets/rami_malek.jpg", "RamiMalek5", false)
        ],
        scrollDirection: Axis.horizontal,
      ),
      margin: EdgeInsets.only(left: 3.0),
      padding: EdgeInsets.only(bottom: 7.5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0)
      )),
    );
  }
}

class OwnStory extends StatelessWidget {
  String _profileurl;

  OwnStory(this._profileurl);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: CircleAvatar(
            child: CircleAvatar(
                backgroundImage: AssetImage(this._profileurl), radius: 28.0),
            backgroundColor: Colors.transparent,
            radius: 30.0,
          ),
        ),
        Positioned(
            bottom: 8.0,
            right: -2.0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 11.0,
            )
        ),
        Positioned(
          bottom: -4.5,
          right: -14.5,
          child: IconButton(
              icon: Icon(Icons.add_circle, color: Colors.blue, size: 20.0),
              onPressed: () {}),
        ),
        Positioned(
          bottom: 0.0,
          child:
              Text("Your Story", style: Theme.of(context).textTheme.subtitle),
        )
      ],
      alignment: FractionalOffset.center,
    );
  }
}

class Story extends StatelessWidget {
  static LinearGradient instagramCircle = LinearGradient(colors: <Color>[
    //Color(0xFF8A3AB9),
    Color(0xFF4C68D7),
    Color(0xFFCD486B),
    Color(0xFFCD486B),
    Color(0xFFFBAD50),
  ], stops: [
    0.0,
    0.2,
    0.5,
    0.7
  ], begin: Alignment.topRight, end: Alignment.bottomLeft);
  String _imgURL, _username;
  bool _unseenStory;

  Story(this._imgURL, this._username, this._unseenStory);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: CircleAvatar(
            child: CircleAvatar(
                backgroundImage: AssetImage(this._imgURL), radius: 28.0),
            backgroundColor: Theme.of(context).primaryColor,
            radius: 30.0,
          ),
          decoration: (_unseenStory)
              ? BoxDecoration(
                  gradient: instagramCircle,
                  shape: BoxShape.circle,
                )
              : BoxDecoration(
                  color: Colors.grey.withOpacity(0.4), shape: BoxShape.circle),
          margin: EdgeInsets.only(left: 6.5, right: 6.5),
          padding: (_unseenStory) ? EdgeInsets.all(2.0) : EdgeInsets.all(1.0),
        ),
        Positioned(
          bottom: 0.0,
          child: Text(
              (_username.length > 12)
                  ? _username.substring(0, 12) + "..."
                  : _username,
              style: Theme.of(context).textTheme.subtitle),
        )
      ],
      alignment: FractionalOffset.center,
    );
  }
}
