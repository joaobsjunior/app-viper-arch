abstract class LoginInteractor {
  Future<bool> loginWithGmail();
  Future<bool> loginWithFacebook();
  Future<bool> loginWithApple();
  Future<bool> loginWithEmailPassword(String email, String password);
}