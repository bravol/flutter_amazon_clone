import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/error_handling.dart';
import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //signup user

  void signUpUser(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      UserModel user = UserModel(
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
        id: '',
      );

      http.Response res = await http.post(
        Uri.parse('$hostUrl/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      //for errors
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {}
  }
}
