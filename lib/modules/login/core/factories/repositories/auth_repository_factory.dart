import '../../../domain/repositories/auth_repository.dart';
import '../../../infra/repositories.dart/auth_repository_impl.dart';
import '../datasources/auth_datasource_factory.dart';

AuthRepository makeAuthRepository() => AuthRepositoryImpl(datasource: makeAuthDatasource());