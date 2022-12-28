import 'package:dartz/dartz.dart';

import '../errors/errors.dart';

abstract class AuthRepository {
  Future<Either<AuthError, bool>> call(String username, String password);
}
