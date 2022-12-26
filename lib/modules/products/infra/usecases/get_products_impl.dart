import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class GetProductsImpl implements GetProducts {
  GetProductsImpl({required this.repository});

  ProductsRepository repository;

  @override
  Future<Either<GetProductsError, List<ProductEntity>>> call() {
    return repository.all();
  }
}
