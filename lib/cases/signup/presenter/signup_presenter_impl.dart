import 'package:flutter/foundation.dart';

import '../interactor/signup_interactor.dart';
import '../router/signup_router.dart';
import 'signup_presenter.dart';

class SignupPresenterImpl implements SignupPresenter {
  final SignupInteractor interactor;
  final SignupRouter router;

  SignupPresenterImpl({required this.interactor, required this.router});

  @override
  void submitSignupForm({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String dateOfBirth,
  }) {
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      // Tratar campos obrigatórios vazios
      if (kDebugMode) {
        print('Campos obrigatórios não podem estar vazios.');
      }
      return;
    }

    interactor
        .registerUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      dateOfBirth: dateOfBirth,
    )
        .then((success) {
      if (success) {
        router.navigateToHome();
      } else {
        // Tratar erro de cadastro
        if (kDebugMode) {
          print('Erro ao cadastrar usuário.');
        }
      }
    });
  }
}
