import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class UpdateProduct{
  Future<Either<UpdateProductError, ProductEntity>> call(ProductEntity entity);
}