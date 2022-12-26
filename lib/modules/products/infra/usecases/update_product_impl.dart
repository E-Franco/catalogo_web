import '../../domain/errors/errors.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class UpdateProductImpl implements UpdateProduct {
  UpdateProductImpl({required this.repository});

  ProductsRepository repository;

  @override
  Future<Either<UpdateProductError, ProductEntity>> call(ProductEntity entity) {
    return repository.update(entity);
  }
}
