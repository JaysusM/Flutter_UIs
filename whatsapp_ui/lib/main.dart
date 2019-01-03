import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainAppState();

}

class MainAppState extends State with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      //Change to bold and grey to white when selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Color(0xFF128c7e),
            textTheme: TextTheme(
                title: TextStyle(
                    fontFamily: 'Instagram', fontWeight: FontWeight.w700),
                subtitle: TextStyle(fontFamily: 'Instagram'))),
        home: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text("Whatsapp",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white)),
              backgroundColor: Color(0xFF128c7e),
              bottom: TabBar(
                controller: _tabController,
                  indicatorColor: Colors.white,
                  indicatorWeight: 2.0,
                  tabs: <Tab>[
                    Tab(
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                    ),
                    Tab(
                        child: Text("CHATS",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(color: Colors.white))),
                    Tab(
                        child: Text("STATUS",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(color: Colors.white))),
                    Tab(
                        child: Text("CALLS",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(color: Colors.white)))
                  ],
                ),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.search, color: Colors.white)),
                IconButton(icon: Icon(Icons.more_vert, color: Colors.white))
              ],
            ),
            body: Container(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Container(
                    child: Text('Camera'),
                  ),
                  Container(
                    child: Text('Chat'),
                  ),
                  Container(
                    child: Text('Status'),
                  ),
                  Container(
                    child: Text('Calls'),
                  )
                ],
              ),
            ),
          ),
        );
  }
}
