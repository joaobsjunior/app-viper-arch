import 'package:flutter/material.dart';

class LoginRouter {
  final BuildContext context;

  LoginRouter(this.context);

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void navigateToSignUp() {
    Navigator.pushNamed(context, '/signup');
  }
}