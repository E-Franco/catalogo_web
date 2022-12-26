import 'package:dartz/dartz.dart';

import '../../errors/errors.dart';

abstract class DeleteSubCategory{
  Future<Either<DeleteSubCategoryError, void>> call(String id, String categoryId);
}

