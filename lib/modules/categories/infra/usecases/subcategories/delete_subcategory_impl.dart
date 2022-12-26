import 'package:dartz/dartz.dart';

import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';

class DeleteSubCategoryImpl implements DeleteSubCategory{
  final SubCategoriesRepository repository;
  DeleteSubCategoryImpl(this.repository);
  
  @override
  Future<Either<DeleteSubCategoryError, void>> call(String id, String categoryId) {
    return repository.delete(id, categoryId);
  }
}