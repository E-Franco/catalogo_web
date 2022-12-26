import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';

class CreateSubCategoryImpl implements CreateSubCategory {
  final SubCategoriesRepository repository;
  const CreateSubCategoryImpl(this.repository);

  @override
  Future<Either<CreateSubCategoryError, SubCategoryEntity>> call(String name, String categoryId) async {
    return repository.create(name, categoryId);
  }
}
