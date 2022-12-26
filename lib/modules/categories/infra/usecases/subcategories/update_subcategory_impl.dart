import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';

class UpdateSubCategoryImpl implements UpdateSubCategory {
  final SubCategoriesRepository repository;
  UpdateSubCategoryImpl(this.repository);

  @override
  Future<Either<UpdateSubCategoryError, SubCategoryEntity>> call(String id, String name, String categoryId) async {
    return repository.update(id, name, categoryId);
  }
}
