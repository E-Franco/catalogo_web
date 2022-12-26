import 'package:catalogo_web/modules/products/domain/errors/errors.dart';
import 'package:catalogo_web/modules/products/domain/entities/product_entity.dart';
import 'package:catalogo_web/modules/products/domain/repositories/products_repository.dart';
import 'package:catalogo_web/modules/products/infra/datasources/product_datasource.dart';
import 'package:dartz/dartz.dart';

import '../models/models.dart';

class ProductRepositoryImpl implements ProductsRepository {
  ProductRepositoryImpl({required this.datasource});

  final ProductDatasource datasource;

  @override
  Future<Either<GetProductsError, List<ProductEntity>>> all() async {
    try {
      final result = await datasource.all();
      return Right(result);
    } catch (_) {
      return Left(GetProductsError());
    }
  }

  @override
  Future<Either<CreateProductError, ProductEntity>> create(ProductEntity entity) async {
    try {
      final model = ProductModel.fromEntity(entity);
      final result = await datasource.create(model);

      return Right(result);
    } catch (_) {
      return Left(CreateProductError());
    }
  }

  @override
  Future<Either<DeleteProductError, void>> delete(String id) async {
    try {
      final result = await datasource.delete(id);
      return Right(result);
    } catch (_) {
      return Left(DeleteProductError());
    }
  }

  @override
  Future<Either<UpdateProductError, ProductEntity>> update(ProductEntity entity) async {
    try {
      final model = ProductModel.fromEntity(entity);
      final result = await datasource.update(model);

      return Right(result);
    } catch (_) {
      return Left(UpdateProductError());
    }
  }
}
