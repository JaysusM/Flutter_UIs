import 'package:flutter/material.dart';

class User {

  String _username, _avatarURL;

  User(this._avatarURL, this._username);

  String get username => _username;

  String get avatarURL => _avatarURL;

}