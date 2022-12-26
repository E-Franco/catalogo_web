import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../errors/category_errors.dart';

abstract class GetCategories {
  Future<Either<GetCategoriesError, List<CategoryEntity>>> call();
}


