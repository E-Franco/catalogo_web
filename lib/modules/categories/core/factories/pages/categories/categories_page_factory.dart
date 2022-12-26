import '../../../../../../service_locator.dart';
import '../../../../ui/pages/categories/categories.dart';

CategoriesPage makeCategoriesPage() => CategoriesPage(
      presenter: serviceLocator.get<CategoriesPresenter>(),
    );
