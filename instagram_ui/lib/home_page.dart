import 'package:flutter/material.dart';
import 'top_menu.dart';
import 'stories.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopMenuWidget(context),
        body: Column(children: <Widget>[
          Container(child: ScrollableStories(), height: 95.0),
          Expanded(
            child: Container(),
            flex: 17,
          )
        ]),
        bottomNavigationBar: Container(
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.home, color: Colors.black, size: 28.0),
                    onPressed: () {},
                    splashColor: Colors.transparent),
                IconButton(
                    icon: Icon(Icons.search, color: Colors.black, size: 28.0),
                    onPressed: () {},
                    splashColor: Colors.transparent),
                IconButton(
                    icon: Icon(Icons.add_box, color: Colors.black, size: 28.0),
                    onPressed: () {},
                    splashColor: Colors.transparent),
                IconButton(
                    icon: Icon(Icons.favorite_border,
                        color: Colors.black, size: 28.0),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.perm_identity,
                        color: Colors.black, size: 28.0),
                    onPressed: () {},
                    splashColor: Colors.transparent),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 7.5),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Colors.black.withOpacity(0.4), width: 0.4))))

        /* This is not working, this shows title parameter widget when selected, it is not implemented the way to not show it.

        BottomNavigationBar(items: <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black), title: Container(height: 0.0)),
        BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.black), title: Container(height: 0.0)),
        BottomNavigationBarItem(icon: Icon(Icons.add_box, color: Colors.black), title: Container(height: 0.0)),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border, color: Colors.black), title: Container(height: 0.0)),
        BottomNavigationBarItem(icon: Icon(Icons.perm_identity, color: Colors.black), title: Container(height: 0.0)),
      ],
      ),*/
        );
  }
}
