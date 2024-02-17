import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    id: '',
  );

  UserModel get user => _user;

  void setUser(String user) {
    _user = UserModel.fromJson(user);
    notifyListeners();
  }
}
