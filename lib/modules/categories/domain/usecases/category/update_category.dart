import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/category_errors.dart';

abstract class UpdateCategory {
  Future<Either<UpdateCategoryError, CategoryEntity>> call(String id, String name);
}


