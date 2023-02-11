import 'package:login_register/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../views/WelcomeScreen.dart';

class AccountViewModel {

  Future<void> removeUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(Constants.IS_LOGGED_IN);
    await prefs.remove(Constants.USER_NAME);
    await prefs.remove(Constants.USER_NAME);
    await prefs.remove(Constants.IS_LOGGED_IN);

    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const WelcomeScreen()) );
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Constants.IS_LOGGED_IN) ?? false;
  }

  Future<void> logOut(BuildContext context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.IS_LOGGED_IN, false);

    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const WelcomeScreen()) );

  }

  Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constants.USER_NAME) ?? '';
  }


}