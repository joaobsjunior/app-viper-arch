import 'home_interactor.dart';
import '../../../core/api/firebase_auth_api.dart';

class HomeInteractorImpl implements HomeInteractor {
  final FirebaseAuthApi authApi;

  HomeInteractorImpl(this.authApi);

  @override
  Future<void> fetchHomeData() async {
    // Lógica para buscar dados da página Home
  }

  @override
  Future<void> logout() async {
    await authApi.logout();
  }
}