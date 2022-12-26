import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class CreateProductImpl implements CreateProduct {
  CreateProductImpl({
    required this.repository,
  });

  ProductsRepository repository;

  @override
  Future<Either<CreateProductError, ProductEntity>> call(ProductEntity entity) {
    return repository.create(entity);
  }
}
