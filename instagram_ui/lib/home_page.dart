import 'package:flutter/material.dart';
import 'top_menu.dart';
import 'stories.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopMenuWidget(context),
      body: Column(children: <Widget>[
        Container(
          child: ScrollableStories(),
          height: 95.0
        ),
        Expanded(
          child: Container(),
          flex: 17,
        )
      ]),
    );
  }
}
