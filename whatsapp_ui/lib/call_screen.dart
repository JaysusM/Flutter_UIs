import 'package:flutter/material.dart';
import 'dummy_data.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyNames.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/linus_torvalds.jpeg"),
                radius: 27.0,
              ),
              trailing: IconButton(icon: Icon(Icons.call, color: Theme.of(context).accentColor), onPressed: null),
              title: Container(
                child: Text(dummyNames[index],
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 16.0)),
                padding: EdgeInsets.only(bottom: 5.0),
              ),
              subtitle: Row(children: <Widget>[
                Icon((dummyCallIsMade[index])
                        ? Icons.call_made
                        : Icons.call_received,
              size: 15.0,
              color: (dummyCallAnswered[index]) ? Colors.green : Colors.red),
                SizedBox(width: 3.0),
                Text(dummyDates[index],
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.grey, fontSize: 14.0))
              ])),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.6), width: 0.3))),
        );
      },
    );
  }
}
