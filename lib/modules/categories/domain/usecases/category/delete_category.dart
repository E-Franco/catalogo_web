import 'package:dartz/dartz.dart';

import '../../errors/category_errors.dart';

abstract class DeleteCategory{
  Future<Either<DeleteCategoryError, void>> call(String id);
}

