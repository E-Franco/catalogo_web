import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class CreateSubCategory {
  Future<Either<CreateSubCategoryError, SubCategoryEntity>> call(String name, String categoryId);
}
