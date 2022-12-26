import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/category_errors.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';

class GetCategoriesImpl implements GetCategories {
  final CategoriesRepository repository;
  const GetCategoriesImpl(this.repository);

  @override
  Future<Either<GetCategoriesError, List<CategoryEntity>>> call() async{
    return repository.all();
  }
}