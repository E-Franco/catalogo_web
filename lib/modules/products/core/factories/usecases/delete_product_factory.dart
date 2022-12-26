import '../../../domain/usecases/usecases.dart';
import '../../../infra/usecases/usecases.dart';
import '../repositories/repositories.dart';

DeleteProduct makeDeleteProduct() => DeleteProductImpl(repository: makeProductsRepository());