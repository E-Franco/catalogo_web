import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/category_errors.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';

class UpdateCategoryImpl implements UpdateCategory {
  final CategoriesRepository repository;
  UpdateCategoryImpl(this.repository);

  @override
  Future<Either<UpdateCategoryError, CategoryEntity>> call(String id, String name) async{
    return repository.update(id, name);
  }
}