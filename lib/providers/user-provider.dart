import 'package:amazon/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  User  _user = User(
      name: "",
      email: "",
      password: "",
      address: "",
      type: "",
      id: "",
      token: "");

  User get user => _user;

  setUser(String user) {
    _user = User.fromJson((user));
    notifyListeners();
  }
}
