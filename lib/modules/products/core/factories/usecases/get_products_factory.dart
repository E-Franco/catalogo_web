import '../../../domain/usecases/usecases.dart';
import '../../../infra/usecases/usecases.dart';
import '../repositories/repositories.dart';

GetProducts makeGetProducts() => GetProductsImpl(repository: makeProductsRepository());
