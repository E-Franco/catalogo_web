import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';
import '../../domain/errors/category_errors.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoryDatasource datasource;
  CategoriesRepositoryImpl(this.datasource);

  @override
  Future<Either<GetCategoriesError, List<CategoryModel>>> all() async {
    try {
      final result = await datasource.all();
      return Right(result);
    } catch (_) {
      return Left(GetCategoriesError());
    }
  }

  @override
  Future<Either<CreateCategoryError, CategoryModel>> create(String name) async {
    try {
      final result = await datasource.create(name);
      return Right(result);
    } catch (_) {
      return Left(CreateCategoryError());
    }
  }

  @override
  Future<Either<DeleteCategoryError, void>> delete(String id) async {
    try {
      final result = await datasource.delete(id);
      return Right(result);
    } catch (_) {
      return Left(DeleteCategoryError());
    }
  }

  @override
  Future<Either<UpdateCategoryError, CategoryModel>> update(String id, String name) async {
    try {
      final result = await datasource.update(id, name);
      return Right(result);
    } catch (_) {
      return Left(UpdateCategoryError());
    }
  }
}
