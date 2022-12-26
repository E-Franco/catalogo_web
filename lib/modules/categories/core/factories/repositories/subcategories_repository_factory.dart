import '../../../domain/repositories/repositories.dart';
import '../../../infra/repositories/subcategories_repository_impl.dart';
import '../datasources/subcategories_datasource_factory.dart';

SubCategoriesRepository makeSubCategoriesRepository() => SubCategoriesRepositoryImpl(makeSubCategoriesDatasource());
