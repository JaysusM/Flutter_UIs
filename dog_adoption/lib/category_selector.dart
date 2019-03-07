import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategorySelector extends StatefulWidget {

  List<String> _categories;

  CategorySelector(this._categories);

  @override
  State<StatefulWidget> createState() => new CategorySelectorState();
}


class CategorySelectorState extends State<CategorySelector> {

  String _selected = null;



  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: widget._categories.map<Widget>((category) {
          return _button(category, category == _selected);
        }).toList()..insert(0, _settingsButton())
    );
  }

  Widget _button(String name, bool selected) {
    return Container(child: FlatButton(
      splashColor: Colors.red,
      child: Center(child: Text(name, style: TextStyle(fontSize: 14.0, color: (selected) ? Colors.white : Colors.black))),
      onPressed: () {
        this.setState(() {_selected = name;});
      },
      color: (selected) ? Colors.red : Colors.grey.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      padding: EdgeInsets.all(0.0),
    ),
      width: 65.0,
      margin: EdgeInsets.only(right: 17.0),
    );
  }
  
  Widget _settingsButton() {
    return Container(child: FlatButton(
      splashColor: Colors.grey,
      child: Center(child: Icon(FontAwesomeIcons.slidersH)),
      onPressed: () {},
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      padding: EdgeInsets.all(0.0),
    ),
      width: 65.0,
      margin: EdgeInsets.only(right: 17.0),
    );
  }

}