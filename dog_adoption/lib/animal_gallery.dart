import 'package:flutter/material.dart';
import 'animal.dart';
import 'animal_info_page.dart';

class AnimalView extends StatefulWidget {
  Animal _animal;

  AnimalView(this._animal);

  @override
  State<StatefulWidget> createState() => AnimalViewState();
}

class AnimalViewState extends State<AnimalView> {
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
                child: GestureDetector(
                  child: ClipRRect(
                    child: Hero(
                        child: Image.asset(widget._animal.imageURL,
                            fit: BoxFit.fitWidth),
                        tag: widget._animal.name),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AnimalInfoPage(widget._animal)));
                  },
                ),
                height: 170.0,
                width: MediaQuery.of(context).size.width,
              )),
          Positioned(
            child: Text(widget._animal.name,
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
                    widget._animal.liked = this.liked;
                  });
                }),
            right: 30.0,
            top: 180.0,
          ),
          Positioned(
            left: 0.0,
            top: 210.0,
            child: Text(widget._animal.breed,
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
