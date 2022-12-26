import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class ProductsRepository {
  Future<Either<CreateProductError, ProductEntity>> create(ProductEntity entity);

  Future<Either<UpdateProductError, ProductEntity>> update(ProductEntity entity);

  Future<Either<DeleteProductError, void>> delete(String id);

  Future<Either<GetProductsError, List<ProductEntity>>> all();
}
