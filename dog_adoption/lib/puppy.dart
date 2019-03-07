class Puppy {

  String _imageURL, _name, _breed;

  Puppy(this._name, this._breed, this._imageURL);

  get breed => _breed;

  get name => _name;

  String get imageURL => _imageURL;
}