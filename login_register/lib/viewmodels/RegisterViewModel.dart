import 'package:login_register/Constants.dart';
import 'package:login_register/views/AccountScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class RegisterViewModel {

  Future<void> saveUser(BuildContext context,String username,String email, String password,String repeatPassword) async {

    bool _isvalidate = await _validate(context, username, email, password, repeatPassword);

    if(_isvalidate){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(Constants.IS_LOGGED_IN, true);
      await prefs.setString(Constants.USER_NAME, username);
      await prefs.setString(Constants.EMAIL, email);
      await prefs.setString(Constants.PASSWORD, password);

      Navigator.push(context, MaterialPageRoute(
          builder: (context) => const AccountScreen()) );
    }
  }


  Future<bool> _validate(BuildContext context,String username,String email, String password,String repeatPassword) async{
    var emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (username.isEmpty) {
      showToast(context, Constants.NAME_CONNOT_BE_EMPTY_);
      return false;
    }else if (email.isEmpty) {
      showToast(context, Constants.EMAIL_CONNOT_BE_EMPTY);
      return false;
    }else if (!emailRegex.hasMatch(email)) {
      showToast(context, Constants.INVALID_EMAIL_ADDRESS);
      return false;
    }else if(password.length < 6){
      showToast(context, Constants.PASSWORD_MUST_BE_LONGER);
      return false;
    }else if(password != repeatPassword){
      showToast(context, Constants.PASSWORD_ARE_NOT_BE_SAME);
      return false;
    }else {
      return true;
    }
  }

  void showToast(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }



}