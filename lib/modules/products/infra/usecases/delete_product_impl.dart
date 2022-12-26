import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class DeleteProductImpl implements DeleteProduct {
  DeleteProductImpl({required this.repository});

  ProductsRepository repository;

  @override
  Future<Either<DeleteProductError, void>> call(String id) {
    return repository.delete(id);
  }
}
