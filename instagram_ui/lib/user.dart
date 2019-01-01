class User {
  String _profilePic, _name;
  bool _unseenStory;

  User(this._profilePic, this._name, this._unseenStory);
  User.loggedUser(this._profilePic, this._name);

  get unseenStory => _unseenStory;

  set unseenStory(value) {
    _unseenStory = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  String get profilePic => _profilePic;

  set profilePic(String value) {
    _profilePic = value;
  }

  static List<User> USER_FOLLOWINGS = [
    User("assets/lebron.jpg", "GOAT", true),
    User("assets/rami_malek.jpg", "Mr.Robot", true),
    User("assets/rami_malek.jpg", "RamiMalek2", false),
    User("assets/rami_malek.jpg", "RamiMalek3", false),
    User("assets/rami_malek.jpg", "RamiMalek4", false),
  ];

  static User LOGGED_USER = User.loggedUser("assets/rami_malek.jpg", "TheRealMalek");

}