import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class GetProducts{
  Future<Either<GetProductsError, List<ProductEntity>>> call();
}