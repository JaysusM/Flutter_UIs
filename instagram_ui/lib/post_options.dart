import 'package:flutter/material.dart';

class PostOptions extends StatefulWidget {
  int _likesNumber;
  bool _liked;

  PostOptions(this._likesNumber, this._liked);

  @override
  State<StatefulWidget> createState() {
    return PostOptionsState();
  }
}

class PostOptionsState extends State<PostOptions> {
  bool _liked;
  int _likesNumber;

  @override
  initState() {
    _liked = widget._liked;
    _likesNumber = widget._likesNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(flex: 1, child: (!_liked)
                ? IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.black),
                    onPressed: switchLiked)
                : IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: switchLiked)),
            Expanded(flex: 1, child: IconButton(icon: Icon(Icons.mode_comment, color: Colors.black))),
            Expanded(flex: 7, child: Container(child: IconButton(icon: Icon(Icons.share, color: Colors.black)), alignment: Alignment.centerLeft)),
            Expanded(flex: 1, child: IconButton(icon: Icon(Icons.bookmark_border, color: Colors.black))),
          ],
        ),
        Container(
          child: Text("${_likesNumber} likes"),
          padding: EdgeInsets.only(left: 15.0),
        ),
        Container(
          child: Text("View 2 comments", style: Theme.of(context).textTheme.subtitle.apply(color: Colors.grey)),
          padding: EdgeInsets.only(left: 15.0, top: 6.0),
        ),
        Container(
          child: Text("32 minutes ago", style: Theme.of(context).textTheme.subtitle.apply(color: Colors.grey, fontSizeDelta: 0.8)),
          padding: EdgeInsets.only(left: 15.0, top: 4.0),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  switchLiked() {
    this.setState(() {
      if (_liked)
        _likesNumber--;
      else
        _likesNumber++;
      _liked = !_liked;
    });
  }
}
