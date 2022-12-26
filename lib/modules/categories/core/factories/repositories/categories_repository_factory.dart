import '../../../domain/repositories/categories_repository.dart';
import '../../../infra/repositories/categories_repository_impl.dart';
import '../datasources/categories_datasource_factory.dart';

CategoriesRepository makeCategoriesRepository() => CategoriesRepositoryImpl(makeCategoriesDatasource());
