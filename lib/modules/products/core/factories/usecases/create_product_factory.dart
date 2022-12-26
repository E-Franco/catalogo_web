import '../../../domain/usecases/usecases.dart';
import '../../../infra/usecases/usecases.dart';
import '../repositories/repositories.dart';

CreateProduct makeCreateProduct() => CreateProductImpl(repository: makeProductsRepository());