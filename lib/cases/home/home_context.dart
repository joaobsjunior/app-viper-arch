import 'package:flutter/material.dart';
import 'view/home_view.dart';
import 'interactor/home_interactor_impl.dart';
import 'presenter/home_presenter_impl.dart';
import 'router/home_router.dart';
import '../../core/api/firebase_auth_api.dart';

class HomeContext {
  static Widget create(BuildContext context) {
    final authApi = FirebaseAuthApi();
    final interactor = HomeInteractorImpl(authApi);
    final router = HomeRouter(context);
    final presenter = HomePresenterImpl(interactor, router);
    return HomeView(presenter);
  }
}