import 'package:catalogo_web/modules/login/domain/repositories/auth_repository.dart';
import 'package:catalogo_web/modules/login/domain/usecases/make_auth.dart';
import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';

class MakeAuthImpl implements MakeAuth {
  MakeAuthImpl({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<AuthError, bool>> call(String username, String password) {
    return repository(username, password);
  }
}
