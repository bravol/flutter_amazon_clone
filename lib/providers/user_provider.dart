import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '',
      id: '',
      cart: []);

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

//updating the user
  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
