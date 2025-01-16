import 'package:flutter/material.dart';
import '../presenter/home_presenter.dart';

class HomeView extends StatelessWidget {
  final HomePresenter presenter;

  const HomeView(this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              presenter.logout();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}