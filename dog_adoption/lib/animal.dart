class Animal {

  String _imageURL, _name, _breed;
  bool _liked;

  Animal(this._name, this._breed, this._imageURL)
    : _liked = false;

  get breed => _breed;

  get name => _name;

  String get imageURL => _imageURL;

  bool get liked => _liked;

  set liked(bool value) {
    _liked = value;
  }
}