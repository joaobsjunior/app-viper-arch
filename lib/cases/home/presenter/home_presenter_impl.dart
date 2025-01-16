import 'home_presenter.dart';
import '../interactor/home_interactor.dart';
import '../router/home_router.dart';

class HomePresenterImpl implements HomePresenter {
  final HomeInteractor interactor;
  final HomeRouter router;

  HomePresenterImpl(this.interactor, this.router);

  @override
  void loadHomeData() async {
    await interactor.fetchHomeData();
    // Atualizar a view com os dados
  }

  @override
  void logout() async {
    await interactor.logout();
    router.navigateToLogin();
  }
}