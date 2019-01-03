import 'package:flutter/material.dart';
import 'dummy_data.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: ListTile(
                leading: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/linus_torvalds.jpeg"),
                        radius: 27.0,
                      ),
                      Positioned(
                        child: CircleAvatar(radius: 10, backgroundColor: Colors.white),
                        bottom: 1.0,
                        right: 1.0,
                      ),
                      Positioned(
                        child: Icon(Icons.add_circle, color: Colors.green, size: 25.0),
                        bottom: -1.0,
                        right: -1.0,
                      )
                    ],
                  ),
                title: Container(
                  child: Text("My status",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: 16.0)),
                  padding: EdgeInsets.only(bottom: 5.0),
                ),
                subtitle: Text("Tap to add status update",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.grey, fontSize: 14.0)))),
        Expanded(
          flex: 1,
          child: Container(
            child: Container(child: Text(
            "Recent updates",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 13.0, color: Colors.black.withOpacity(0.5))),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0))
            ),
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            ),
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Expanded(
          flex: 12,
          child: ListView.builder(itemBuilder: (BuildContext context, int index) {
            return Container(
              child: ListTile(
                  leading: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.7),
                        radius: 27.0,
                      ),
                      Positioned(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25.5,
                        ),
                        left: 1.5,
                        top: 1.5,
                      ),
                      Positioned(child: CircleAvatar(
                        backgroundImage: AssetImage("assets/linus_torvalds.jpeg"),
                        radius: 24.0,
                      ),
                      left: 3.0,
                        top: 3.0,
                      )
                    ],
                  ),
                  title: Container(
                    child: Text(dummyNames[index],
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontSize: 16.0)),
                    padding: EdgeInsets.only(bottom: 5.0),
                  ),
                  subtitle: Text(dummyDates[index],
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: Colors.grey, fontSize: 14.0))
                  ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.6), width: 0.3))),
            );
          },
          itemCount: dummyNames.length,
          ),
        )
      ],
    );
  }
}
