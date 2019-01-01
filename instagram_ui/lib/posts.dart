import 'package:flutter/material.dart';
import 'user.dart';
import 'post_options.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Post.fromUser(User.USER_FOLLOWINGS[0], "https://cdn.mos.cms.futurecdn.net/FUE7XiFApEqWZQ85wYcAfM.jpg", 19),
        Post.fromUser(User.USER_FOLLOWINGS[1], "https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg", 2)
      ],
      scrollDirection: Axis.vertical,
    );
  }
}

class Post extends StatelessWidget {
  String _username, _userProfilePic, _postImageURL;
  int _postLikes;
  bool _unseenStory;

  Post(this._username, this._userProfilePic, this._unseenStory, this._postImageURL, this._postLikes);

  Post.fromUser(User u, String postImageURL, int postLikes) : this(u.name, u.profilePic, u.unseenStory, postImageURL, postLikes);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: CircleAvatar(
                            backgroundImage: AssetImage(this._userProfilePic),
                            radius: 16.0),
                        margin: EdgeInsets.only(top: 7.5),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(_username),
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(top: 7.5),
                      ),
                      flex: 8,
                    ),
                    Expanded(
                      child: IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.grey),
                          onPressed: () {
                            _showPostOptions(context);
                          }),
                      flex: 1,
                    )
                  ],
                ),
                margin: EdgeInsets.only(left: 7.5, bottom: 7.5, right: 7.5),
              )),
          Expanded(
            flex: 23,
            child: FadeInImage(placeholder: AssetImage("assets/loading.gif"), image: NetworkImage(this._postImageURL), fit: BoxFit.cover)
          ),
          Expanded(
            flex: 7,
            child: PostOptions(_postLikes, false),
          )
        ],
      ),
      height: 490.0,
    );
  }

  void _showPostOptions(BuildContext ctxt) {
    TextStyle style =
        Theme.of(ctxt).textTheme.subtitle.apply(fontSizeDelta: 2.5);
    showDialog(
        context: ctxt,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Column(
                children: <Widget>[
                  FlatButton(
                    child: Text("Share link...", style: style),
                    onPressed: null,
                  ),
                  FlatButton(
                    child: Text("Report...", style: style),
                    onPressed: null,
                  ),
                  FlatButton(
                    child: Text("Turn On Post Notifications", style: style),
                    onPressed: null,
                  ),
                  FlatButton(
                    child: Text("Unfollow", style: style),
                    onPressed: null,
                  ),
                  FlatButton(
                    child: Text("Mute", style: style),
                    onPressed: null,
                  ),
                ],
              ),
              height: 240.0,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            contentPadding: EdgeInsets.only(bottom: 2.0),
          );
        });
  }
}
