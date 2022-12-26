import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class UpdateSubCategory {
  Future<Either<UpdateSubCategoryError, SubCategoryEntity>> call(String id, String name, String categoryId);
}
