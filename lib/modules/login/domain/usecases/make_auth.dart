import 'package:catalogo_web/modules/login/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class MakeAuth {
  Future<Either<AuthError, bool>> call(String username, String password);
}
