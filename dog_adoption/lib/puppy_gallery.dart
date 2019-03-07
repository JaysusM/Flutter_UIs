import 'package:flutter/material.dart';
import 'puppy.dart';

class PuppyGallery extends StatelessWidget {
  static List<Puppy> _puppies = [
    new Puppy("Puppy Katherin", "French vanilla puppy", "assets/puppy_1.jpg"),
    new Puppy("Puppy Luna", "Good boi", "assets/puppy_2.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: _puppies.map<Widget>((puppy) => PuppyView(puppy)).toList());
  }
}

class PuppyView extends StatefulWidget {
  Puppy _puppy;

  PuppyView(this._puppy);

  @override
  State<StatefulWidget> createState() => PuppyViewState();
}

class PuppyViewState extends State<PuppyView> {
  bool liked;

  @override
  void initState() {
    liked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            top: 0.0,
            child: Container(
                child: ClipRRect(
                  child: Image.asset(widget._puppy.imageURL, fit: BoxFit.fitWidth),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0)
                  ),
                ),
            height: 170.0,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            child: Text(widget._puppy.name,
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
            left: 0.0,
            top: 185.0,
          ),
          Positioned(
            child: IconButton(
                icon: Icon((liked) ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red, size: 25.0),
                onPressed: () {
                  this.setState(() {
                    this.liked = !this.liked;
                  });
                }),
            right: 30.0,
            top: 180.0,
          ),
          Positioned(
            left: 0.0,
            top: 210.0,
            child: Text(widget._puppy.breed,
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700)),
          )
        ],
      ),
      height: 230.0,
      margin: EdgeInsets.only(bottom: 15.0),
    );
  }
}
