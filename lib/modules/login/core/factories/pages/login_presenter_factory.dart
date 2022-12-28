import '../../../presentation/value_notifier_login_presenter.dart';
import '../../../ui/login_presenter.dart';
import '../usecases/make_auth_factory.dart';

LoginPresenter makeLoginPresenter() => ValueNotifierLoginPresenter(makeAuth: makeMakeAuth());