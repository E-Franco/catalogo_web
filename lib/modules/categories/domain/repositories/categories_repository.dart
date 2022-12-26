import 'package:dartz/dartz.dart';

import '../entities/category_entity.dart';
import '../errors/category_errors.dart';

abstract class CategoriesRepository{
  Future<Either<CreateCategoryError, CategoryEntity>> create(String name);
  
  Future<Either<UpdateCategoryError, CategoryEntity>> update(String id, String name);

  Future<Either<DeleteCategoryError, void>> delete(String id);

  Future<Either<GetCategoriesError, List<CategoryEntity>>> all();
}