import 'package:catalogo_web/modules/products/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteProduct {
  Future<Either<DeleteProductError, void>> call(String id);
}
