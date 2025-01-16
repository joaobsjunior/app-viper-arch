import 'login_presenter.dart';
import '../interactor/login_interactor.dart';
import '../router/login_router.dart';

class LoginPresenterImpl implements LoginPresenter {
  final LoginInteractor interactor;
  final LoginRouter router;

  LoginPresenterImpl({required this.interactor, required this.router});

  @override
  void loginWithGmail() {
    interactor.loginWithGmail().then((result) {
      if (result) {
        router.navigateToHome();
      } else {
        // Tratar erro de login
      }
    });
  }

  @override
  void loginWithFacebook() {
    interactor.loginWithFacebook().then((result) {
      if (result) {
        router.navigateToHome();
      } else {
        // Tratar erro de login
      }
    });
  }

  @override
  void loginWithApple() {
    interactor.loginWithApple().then((result) {
      if (result) {
        router.navigateToHome();
      } else {
        // Tratar erro de login
      }
    });
  }

  @override
  void loginWithEmailPassword(String email, String password) {
    interactor.loginWithEmailPassword(email, password).then((result) {
      if (result) {
        router.navigateToHome();
      } else {
        // Tratar erro de login
      }
    });
  }

  @override
  void signUp() {
    router.navigateToSignUp();
  }
}