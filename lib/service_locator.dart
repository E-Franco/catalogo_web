import 'package:get_it/get_it.dart';

import 'modules/categories/core/factories/factories.dart';
import 'modules/categories/ui/pages/categories/categories.dart';
import 'modules/products/core/factories/factories.dart';
import 'modules/products/ui/pages/products/products.dart';

final serviceLocator = GetIt.instance;

void setUp() {
  final categoriesPresenter = makeCategoriesPresenter()..init();
  final productsPresenter = makeProductsPresenter()..init();

  serviceLocator.registerLazySingleton<CategoriesPresenter>(() => categoriesPresenter);
  serviceLocator.registerLazySingleton<ProductsPresenter>(() => productsPresenter);
}
