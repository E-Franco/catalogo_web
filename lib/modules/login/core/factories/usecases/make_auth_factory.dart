import '../../../domain/usecases/make_auth.dart';
import '../../../infra/usecases/make_auth_impl.dart';
import '../repositories/auth_repository_factory.dart';

MakeAuth makeMakeAuth() => MakeAuthImpl(repository: makeAuthRepository());