import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class CreateProduct{
  Future<Either<CreateProductError, ProductEntity>> call(ProductEntity entity);
}