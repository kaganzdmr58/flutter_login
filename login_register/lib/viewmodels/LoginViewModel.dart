import 'dart:async';
import 'package:login_register/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../views/AccountScreen.dart';

class LoginViewModel {

  Future<void> login(BuildContext context,String email,String password) async {
    final prefs = await SharedPreferences.getInstance();
    final saveEmail = prefs.getString(Constants.USER_NAME) ?? '';
    final savePassword = prefs.getString(Constants.PASSWORD) ?? '';

    bool _isvalidate = await _validate(context, email, password);

    if(_isvalidate){
      if (saveEmail.isNotEmpty && password.isNotEmpty) {
        if (email == saveEmail && savePassword == password) {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => const AccountScreen()) );
        } else {
          showToast(context, Constants.INCORRECT_USER_NAME_OR_PASSWORD);
        }
      } else {
        showToast(context, Constants.REGISTERED_USER_NOT_FOUND);
      }
    }

  }

  Future<bool> _validate(BuildContext context,String email, String password) async{
    var emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (email.isEmpty) {
      showToast(context, Constants.EMAIL_CONNOT_BE_EMPTY);
      return false;
    }else if (!emailRegex.hasMatch(email)) {
      showToast(context, Constants.INVALID_EMAIL_ADDRESS);
      return false;
    }else if(password.length < 6){
      showToast(context, Constants.PASSWORD_MUST_BE_LONGER);
      return false;
    }else {
      return true;
    }
  }

  void showToast(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }




}