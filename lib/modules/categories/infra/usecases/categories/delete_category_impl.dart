import 'package:dartz/dartz.dart';

import '../../../domain/errors/category_errors.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';

class DeleteCategoryImpl implements DeleteCategory{
  final CategoriesRepository repository;
  DeleteCategoryImpl(this.repository);
  
  @override
  Future<Either<DeleteCategoryError, void>> call(String id) {
    return repository.delete(id);
  }
}