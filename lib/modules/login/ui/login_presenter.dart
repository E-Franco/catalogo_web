import 'package:catalogo_web/common/common.dart';

abstract class LoginPresenter implements BasePresenter {
  abstract String? username;
  abstract String? password;

  Future<bool> auth();
  void changeUsername(String value);
  void changePassword(String value);
}
