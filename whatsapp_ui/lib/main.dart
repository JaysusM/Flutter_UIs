import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'call_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainAppState();

}

class MainAppState extends State with SingleTickerProviderStateMixin {

  TabController _tabController;
  final List<Widget> _floatingActionButtons = [
    Container(),
    FloatingActionButton(onPressed: null, child: Icon(Icons.message, color: Colors.white), backgroundColor: Colors.green),
    FloatingActionButton(onPressed: null, child: Icon(Icons.center_focus_strong, color: Colors.white), backgroundColor: Colors.green),
    FloatingActionButton(onPressed: null, child: Icon(Icons.add_call, color: Colors.white), backgroundColor: Colors.green)
  ];

  Widget _selectedFloatingActionButton;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _selectedFloatingActionButton = _floatingActionButtons[1];
    _tabController.addListener(() {
      //TODO Change to bold and grey to white when selected
      this.setState(() {
        _selectedFloatingActionButton = _floatingActionButtons[_tabController.index];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Color(0xFF075E54),
            textTheme: TextTheme(
                title: TextStyle(
                    fontWeight: FontWeight.w600),
                subtitle: TextStyle(fontWeight: FontWeight.w400))),
        home: Scaffold(
          floatingActionButton: _selectedFloatingActionButton,
            appBar: AppBar(
              elevation: 0.0,
              title: Text("WhatsApp",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white)),
              backgroundColor: Color(0xFF075E54),
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
                  ChatScreen(),
                  Container(
                    child: Text('Status'),
                  ),
                  CallScreen()
                ],
              ),
            ),
          ),
        );
  }
  }

}
