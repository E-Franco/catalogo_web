import '../../../ui/login_page.dart';
import 'login_presenter_factory.dart';

LoginPage makeLoginPage() => LoginPage(presenter: makeLoginPresenter());