import 'package:flutter/material.dart';
import 'dummy_data.dart';

class ChatScreen extends StatelessWidget {
  
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
            trailing: Container(child: Text(dummyTime[index], style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 11.0, color: Colors.grey.withOpacity(0.8))),
            margin: EdgeInsets.only(bottom: 40.0),
            ),
            title: Container(child: Text(dummyNames[index],
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0)),
                padding: EdgeInsets.only(bottom: 5.0),
            ),
            subtitle: Row(children: <Widget>[
              Image(image: AssetImage((dummyReadStatus[index] != 1) ? "assets/double_tick.png" : "assets/single_tick.png"), color: (dummyReadStatus[index] == 2) ? Colors.blue : Colors.grey.withOpacity(0.8), height: 14.0, width: 14.0),
              SizedBox(width: 3.0),
              Text(dummyMessages[index],
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: Colors.grey, fontSize: 13.0))
            ])
          ),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.6), width: 0.3))),
        );
      },
    );
  }
}
