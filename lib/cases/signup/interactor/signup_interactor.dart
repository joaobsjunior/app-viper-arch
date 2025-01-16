abstract class SignupInteractor {
  Future<bool> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String dateOfBirth,
  });
}
