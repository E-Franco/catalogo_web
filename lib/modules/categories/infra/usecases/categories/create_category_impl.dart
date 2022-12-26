import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/category_errors.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';

class CreateCategoryImpl implements CreateCategory {
  final CategoriesRepository repository;
  const CreateCategoryImpl(this.repository);

  @override
  Future<Either<CreateCategoryError, CategoryEntity>> call(String name) async{
    return repository.create(name);
  }
}