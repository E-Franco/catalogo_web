import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

class SubCategoriesRepositoryImpl implements SubCategoriesRepository {
  final SubCategoryDatasource datasource;
  SubCategoriesRepositoryImpl(this.datasource);

  @override
  Future<Either<GetSubCategoriesError, List<SubCategoryModel>>> all(String categoryId) async {
    try {
      final result = await datasource.all(categoryId);
      return Right(result);
    } catch (_) {
      return Left(GetSubCategoriesError());
    }
  }

  @override
  Future<Either<CreateSubCategoryError, SubCategoryEntity>> create(String name, String categoryId) async {
    try {
      final result = await datasource.create(name, categoryId);
      return Right(result);
    } catch (_) {
      return Left(CreateSubCategoryError());
    }
  }

  @override
  Future<Either<DeleteSubCategoryError, void>> delete(String id, String categoryId) async {
    try {
      final result = await datasource.delete(id, categoryId);
      return Right(result);
    } catch (_) {
      return Left(DeleteSubCategoryError());
    }
  }

  @override
  Future<Either<UpdateSubCategoryError, SubCategoryEntity>> update(String id, String name, String categoryId) async {
    try {
      final result = await datasource.update(id, name, categoryId);
      return Right(result);
    } catch (_) {
      return Left(UpdateSubCategoryError());
    }
  }
}
