import 'package:flutter/material.dart';

import 'interactor/signup_interactor_impl.dart';
import 'presenter/signup_presenter_impl.dart';
import 'router/signup_router.dart';
import 'view/signup_view.dart';

class SignupContext {
  static Widget create(BuildContext context) {
    final interactor = SignupInteractorImpl();
    final router = SignupRouter(context);
    final presenter =
        SignupPresenterImpl(interactor: interactor, router: router);
    return SignupView(presenter: presenter);
  }
}
