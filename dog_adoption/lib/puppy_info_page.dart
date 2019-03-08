import 'package:flutter/material.dart';
import 'puppy.dart';

class PuppyInfoPage extends StatefulWidget {
  final Puppy _puppy;

  PuppyInfoPage(this._puppy);

  @override
  State<StatefulWidget> createState() => PuppyInfoPageState();
}

class PuppyInfoPageState extends State<PuppyInfoPage> {
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
    return MaterialApp(
        theme: ThemeData(fontFamily: 'OpenSans'),
        home: Material(
            child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () { Navigator.pop(context); },
                ),
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Hero(
                          tag: widget._puppy.name,
                          child: Image.asset(widget._puppy.imageURL,
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Center(
                                  child: Text(widget._puppy.breed,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w700))),
                              top: 55.0,
                              left: 26.0,
                            ),
                            Positioned(
                              child: Text(widget._puppy.name,
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
                                  (widget._puppy.liked)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  this.setState(() {
                                    widget._puppy.liked = !widget._puppy.liked;
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
                title: Text(widget._puppy.name,
                    style: TextStyle(
                        color:
                            (_isScrolling) ? Colors.white : Colors.transparent,
                        fontWeight: FontWeight.w700)),
              ),
              pinned: true,
              backgroundColor: Colors.red,
            ),
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate(List.generate(
                      20,
                      (index) => new FlatButton(
                          onPressed: null, child: Text("Button"))))),
            )
          ],
        )));
  }
}
