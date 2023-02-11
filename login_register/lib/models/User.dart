import 'package:flutter/material.dart';

class User extends ChangeNotifier{
  String name;
  String email;
  String password;

  User({required this.name,  required this.email, required this.password});
}