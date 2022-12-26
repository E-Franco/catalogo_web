import '../../../domain/repositories/repositories.dart';
import '../../../infra/repositories/repositories.dart';
import '../datasources/datasources.dart';

ProductsRepository makeProductsRepository() => ProductRepositoryImpl(datasource: makeProductsDatasource());