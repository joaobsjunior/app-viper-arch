import 'package:viperarch/core/api/firebase_auth_api.dart';
import 'package:flutter/foundation.dart';

import 'login_interactor.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginInteractorImpl implements LoginInteractor {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginInteractorImpl(FirebaseAuthApi authApi);

  @override
  Future<bool> loginWithGmail() async {
    // Implementação do login com Gmail
    return true;
  }

  @override
  Future<bool> loginWithFacebook() async {
    // Implementação do login com Facebook
    return true;
  }

  @override
  Future<bool> loginWithApple() async {
    // Implementação do login com Apple
    return true;
  }

  @override
  Future<bool> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user != null;
    } catch (e) {
      if (kDebugMode) {
        print("Erro de login: $e");
      }
      return false;
    }
  }
}