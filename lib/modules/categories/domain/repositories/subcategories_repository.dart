import 'package:dartz/dartz.dart';

import '../entities/subcategory_entity.dart';
import '../errors/errors.dart';

abstract class SubCategoriesRepository {
  Future<Either<CreateSubCategoryError, SubCategoryEntity>> create(String name, String categoryId);

  Future<Either<UpdateSubCategoryError, SubCategoryEntity>> update(String id, String name, String categoryId);

  Future<Either<DeleteSubCategoryError, void>> delete(String id, String categoryId);

  Future<Either<GetSubCategoriesError, List<SubCategoryEntity>>> all(String categoryId);
}
