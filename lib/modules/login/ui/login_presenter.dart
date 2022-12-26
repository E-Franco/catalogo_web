import 'package:catalogo_web/common/common.dart';

abstract class LoginPresenter implements BasePresenter{
  Future<bool> auth();
}