import 'package:flutter/material.dart';

class HomeRouter {
  final BuildContext context;

  HomeRouter(this.context);

  void navigateToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }
}