import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/category_errors.dart';

abstract class CreateCategory {
  Future<Either<CreateCategoryError, CategoryEntity>> call(String name);
}


