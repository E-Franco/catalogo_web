import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';

class GetSubCategoriesImpl implements GetSubCategories {
  final SubCategoriesRepository repository;
  const GetSubCategoriesImpl(this.repository);

  @override
  Future<Either<GetSubCategoriesError, List<SubCategoryEntity>>> call(String categoryId) async {
    return repository.all(categoryId);
  }
}
