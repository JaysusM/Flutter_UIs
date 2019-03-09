class Animal {

  String _imageURL, _name, _breed, _age, _sex, _color, _height, _weight;
  bool _liked;

  Animal(this._name, this._breed, this._imageURL, this._age, this._sex, this._color, this._height, this._weight)
    : _liked = false;


  get age => _age;

  get breed => _breed;

  get name => _name;

  String get imageURL => _imageURL;

  bool get liked => _liked;

  set liked(bool value) {
    _liked = value;
  }

  get sex => _sex;

  get color => _color;

  get height => _height;

  get weight => _weight;
}