import 'package:flutter/material.dart';
import 'home_gallery.dart';

class IndexScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => IndexScreenState();

}

class IndexScreenState extends State<IndexScreen> {

  int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = 0;
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
                      NetflixAppbar(),
                  expandedHeight: MediaQuery.of(context).size.height * 0.6,
                ),
              ];
            },
            body: HomeGallery()
        ),
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

class NetflixAppbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextStyle sectionsOptions = TextStyle(color: Colors.white, fontSize: 15.0);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset("assets/endgame.jpg", fit: BoxFit.cover),
        Positioned(child: Row(
            children: <Widget>[
              Text("Shows", style: sectionsOptions),
              Text("Movies", style: sectionsOptions),
              Text("My list", style: sectionsOptions)
            ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
          top: 50.0,
          left: 80.0, // More or less the width of Netflix logo
          width: MediaQuery.of(context).size.width/1.5,
        ),
        Positioned(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            bottomIcon(Icons.add, "My List"),
            playButton(),
            bottomIcon(Icons.info_outline, "Info"),
          ],
        ),
          bottom: 20.0,
          width: MediaQuery.of(context).size.width/1.7,
        )
      ],
      alignment: Alignment.center,
    );
  }

  static Widget playButton() {
    return Container(child: Row(
      children: <Widget>[
        Icon(Icons.play_arrow, color: Colors.black, size: 30.0),
        Text("Play", style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold))
      ],
    ),
      padding: EdgeInsets.fromLTRB(10.0, 3.0, 15.0, 3.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2.0)), color: Colors.white),
    );
  }

  static Widget bottomIcon(IconData icon, String label) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.white),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 10.0))
      ],
    );
  }
}