import 'package:catalogo_web/modules/login/infra/datasources/auth_datasources.dart';
import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.datasource,
  });

  final AuthDatasource datasource;

  @override
  Future<Either<AuthError, bool>> call(String username, String password) async {
    try {
      final result = await datasource.auth(username, password);
      return Right(result);
    } catch (_) {
      return Left(AuthError());
    }
  }
}
