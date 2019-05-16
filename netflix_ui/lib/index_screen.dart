import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => IndexScreenState();

}

class IndexScreenState extends State<IndexScreen> {

  int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leading: Image.asset("assets/netflix-icon.png"),
                  flexibleSpace:
                      Image.asset("assets/endgame.jpg", fit: BoxFit.cover),
                  expandedHeight: MediaQuery.of(context).size.height * 0.6,
                ),
              ];
            },
            body: Container()),
        bottomNavigationBar: Theme(
            data: ThemeData(canvasColor: Colors.black),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), title: Text("Search")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.tv), title: Text("Coming soon")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.file_download), title: Text("Downloads")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu), title: Text("More")),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              elevation: 0.0,
              selectedFontSize: 12.0,
              unselectedFontSize: 12.0,
              onTap: (index) {
                this.setState(() {
                  _selectedIndex = index;
                });
              },
            )));
  }
}
