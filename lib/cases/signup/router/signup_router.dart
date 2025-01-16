import 'package:flutter/material.dart';

class SignupRouter {
  final BuildContext context;

  SignupRouter(this.context);

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void navigateBack() {
    Navigator.pop(context);
  }
}
