
import 'package:flutter/material.dart';
import 'package:login_register/views/LoginScreen.dart';
import 'package:login_register/views/RegisterScreen.dart';

class WelcomeViewModel{

  Future<void> gotoLogin(BuildContext context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()) );
  }

  Future<void> gotoRegister(BuildContext context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()) );
  }

  void showToast(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }

}