import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'signup_interactor.dart';

class SignupInteractorImpl implements SignupInteractor {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<bool> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String dateOfBirth,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Supondo que você armazene o nome e sobrenome em Firestore ou outro banco
      // Adicione a lógica para salvar os dados do usuário em seu banco de dados aqui

      return userCredential.user != null;
    } catch (e) {
      if (kDebugMode) {
        print("Erro ao cadastrar: $e");
      }
      return false;
    }
  }
}
