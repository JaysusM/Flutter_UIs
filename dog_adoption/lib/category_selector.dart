import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'animal_gallery.dart';
import 'animal.dart';

class CategorySelector extends StatefulWidget {
  List<String> _categories;

  CategorySelector(this._categories);

  @override
  State<StatefulWidget> createState() => new CategorySelectorState();
}

class CategorySelectorState extends State<CategorySelector> {
  String _selected;
  static List<Animal> _puppies = [
    new Animal("Puppy Katherin", "French vanilla puppy", "assets/puppy_1.jpg", "1", "Female", "Vanilla", "0.5m", "1kg"),
    new Animal("Puppy Luna", "Good boi", "assets/puppy_2.jpg", "2", "Male", "Vanilla", "0.3m", "1kg"),
    new Animal(
        "Puppy Katherin 2", "French vanilla puppy", "assets/puppy_1.jpg", "0", "Female", "White", "0.25m", "1kg"),
    new Animal("Puppy Luna 2", "Good boi", "assets/puppy_2.jpg", "3", "Male", "Black", "0.5m", "1kg"),
    new Animal(
        "Puppy Katherin 3", "French vanilla puppy", "assets/puppy_1.jpg", "1", "Female", "Vanilla", "0.5m", "1kg"),
    new Animal("Puppy Luna 3", "Good boi", "assets/puppy_2.jpg", "2", "Male", "Vanilla", "0.5m", "1kg"),
  ];

  static List<Animal> _kittens = [
    new Animal("Kitten Martha", "Unknown breed", "assets/kitten_1.jpeg", "1", "Female", "Black", "0.5m", "1kg"),
    new Animal("Kitten Santa", "Good girl", "assets/kitten_2.jpeg", "3", "Male", "Brown", "0.5m", "1kg"),
    new Animal("Kitten Martha 2", "Unknown breed", "assets/kitten_1.jpeg", "2", "Male", "Vanilla", "0.5m", "1kg"),
    new Animal("Kitten Santa 2", "Good girl", "assets/kitten_2.jpeg", "1", "Female", "Vanilla", "0.5m", "1kg"),
    new Animal("Kitten Martha 3", "Unknown breed", "assets/kitten_1.jpeg", "3", "Female", "Vanilla", "0.5m", "1kg"),
    new Animal("Kitten Santa 3", "Good girl", "assets/kitten_2.jpeg", "1", "Female", "Vanilla", "0.5m", "1kg"),
  ];

  @override
  void initState() {
    _selected = "Dogs";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget._categories.map<Widget>((category) {
                return _categoryButton(category, category == _selected);
              }).toList()
                ..insert(0, _settingsButton())),
          height: 65.0,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.only(left: 15.0)),
      Container(height: 15.0),
      Expanded(
        child: Container(
          child: ListView(
              children: _getSelectedAnimalList()
                  .map<Widget>((puppy) => AnimalView(puppy))
                  .toList()),
          margin: EdgeInsets.only(left: 40.0),
        ),
      )
    ]);
  }

  List<Animal> _getSelectedAnimalList() {
    return (_selected == "Dogs") ? _puppies : _kittens;
  }

  Widget _categoryButton(String name, bool selected,
      {height = 65.0, width = 65.0}) {
    return Container(
      child: FlatButton(
        splashColor: Colors.red,
        child: Center(
            child: Text(name,
                style: TextStyle(
                    fontSize: 14.0,
                    color: (selected) ? Colors.white : Colors.black))),
        onPressed: () {
          this.setState(() {
            _selected = name;
          });
        },
        color: (selected) ? Colors.red : Colors.grey.withOpacity(0.15),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        padding: EdgeInsets.all(0.0),
      ),
      width: width,
      height: height,
      margin: EdgeInsets.only(right: 17.0),
    );
  }

  Widget _settingsButton() {
    return Container(
      child: FlatButton(
        splashColor: Colors.grey,
        child: Center(child: Icon(FontAwesomeIcons.slidersH)),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        color: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        padding: EdgeInsets.all(0.0),
      ),
      width: 65.0,
      margin: EdgeInsets.only(right: 17.0),
    );
  }
}
