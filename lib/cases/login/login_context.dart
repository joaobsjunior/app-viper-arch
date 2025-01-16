import 'package:flutter/material.dart';
import 'view/login_view.dart';
import 'interactor/login_interactor_impl.dart';
import 'presenter/login_presenter_impl.dart';
import 'router/login_router.dart';
import '../../core/api/firebase_auth_api.dart';

class LoginContext {
  static Widget create(BuildContext context) {
    final authApi = FirebaseAuthApi();
    final interactor = LoginInteractorImpl(authApi);
    final router = LoginRouter(context);
    final presenter = LoginPresenterImpl(interactor:interactor, router:router);
    return LoginView(presenter: presenter);
  }
}