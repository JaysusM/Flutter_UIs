import 'package:flutter/material.dart';
import 'animal.dart';
import 'user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimalInfoPage extends StatefulWidget {
  final Animal _animal;

  AnimalInfoPage(this._animal);

  @override
  State<StatefulWidget> createState() => AnimalInfoPageState();
}

class AnimalInfoPageState extends State<AnimalInfoPage> {
  ScrollController _scrollController;
  bool _isScrolling;

  @override
  void initState() {
    _isScrolling = false;
    _scrollController = new ScrollController()
      ..addListener(() {
        this.setState(() {
          if (_scrollController.offset > 240.0) {
            _isScrolling = true;
          } else {
            _isScrolling = false;
          }
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, _) => <Widget>[
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  expandedHeight: 280.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Container(child: Hero(
                              tag: widget._animal.name,
                              child: Image.asset(widget._animal.imageURL,
                                  fit: BoxFit.fitWidth)),
                          color: Colors.white,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.white,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Center(
                                      child: Text(widget._animal.breed,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w700))),
                                  top: 55.0,
                                  left: 26.0,
                                ),
                                Positioned(
                                  child: Text(widget._animal.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 27.0,
                                          fontWeight: FontWeight.w700)),
                                  top: 15.0,
                                  left: 25.0,
                                ),
                                Positioned(
                                  child: IconButton(
                                    icon: Icon(
                                      (widget._animal.liked)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      this.setState(() {
                                        widget._animal.liked =
                                            !widget._animal.liked;
                                      });
                                    },
                                  ),
                                  right: 25.0,
                                  top: 25.0,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    collapseMode: CollapseMode.pin,
                    title: Text(widget._animal.name,
                        style: TextStyle(
                            color: (_isScrolling)
                                ? Colors.white
                                : Colors.transparent,
                            fontWeight: FontWeight.w700)),
                  ),
                  pinned: true,
                  backgroundColor: Colors.red,
                )
              ],
          body: Stack(children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: ListView(
                    children: <Widget>[
                      _categoryButton("Age", widget._animal.age),
                      _categoryButton("Sex", widget._animal.sex),
                      _categoryButton("Color", widget._animal.color),
                      _categoryButton("Height", widget._animal.height),
                      _categoryButton("Weight", widget._animal.weight),
                    ],
                    scrollDirection: Axis.horizontal,
                  ),
                  height: 70.0,
                  margin: EdgeInsets.only(left: 35.0),
                ),
                Container(
                    child: _ownerProfile(),
                    margin: EdgeInsets.only(left: 15.0, top: 20.0)),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
                  child: Text(
                      "I recently lost my job and don't have enought time or money to tend to Bo anymore. I have a lot of health issues that need attention...",
                      style: TextStyle(fontSize: 17.0, fontFamily: 'NotoSans')),
                )
              ],
            ),
            Positioned(child: _adoptionWidget(), bottom: 0.0, left: 0.0)
          ]),
        ),
        backgroundColor: Colors.white,
        );
  }

  Widget _categoryButton(String attributeName, String valueName) {
    return Container(
      child: Material(
        child: Column(
          children: <Widget>[
            Text(attributeName,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.red)),
            Text(valueName,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        color: Colors.grey.withOpacity(0.15),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
      width: 70.0,
      height: 70.0,
      margin: EdgeInsets.only(right: 17.0),
    );
  }

  Widget _ownerProfile() {
    User _user = User("assets/avatar_1.jpg", "Jose Bordalas");

    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 17.5,
              left: 17.5,
              child: ClipOval(
                  child: new Image.asset(_user.avatarURL,
                      width: 35.0, height: 35.0, fit: BoxFit.fitHeight))),
          Positioned(
            top: 15.0,
            left: 69.0,
            child: Text(_user.username,
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
          ),
          Positioned(
            top: 38.0,
            left: 67.0,
            child: Text("Owner",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrange)),
          ),
          Positioned(
            top: 22.0,
            right: 37.0,
            child: Text("1.68km",
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrange)),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0))),
      height: 70.0,
    );
  }

  Widget _adoptionWidget() {
    return Container(
      height: 90.0,
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.grey.withOpacity(0.1)),
            height: 65.0,
            width: 75.0,
            child: Icon(Icons.save_alt),
          ),
          Container(width: 35.0),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Colors.redAccent),
              height: 65.0,
              width: 200.0,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(FontAwesomeIcons.paw, color: Colors.white),
                    margin: EdgeInsets.only(left: 25.0, right: 20.0),
                  ),
                  Text("A D O P T I O N",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                          color: Colors.white))
                ],
              ))
        ],
      ),
      color: Colors.white,
      padding: EdgeInsets.only(top: 15.0, left: 35.0, bottom: 15.0),
    );
  }
}
