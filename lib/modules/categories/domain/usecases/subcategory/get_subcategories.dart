import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class GetSubCategories {
  Future<Either<GetSubCategoriesError, List<SubCategoryEntity>>> call(String categoryId);
}
