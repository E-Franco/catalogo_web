import 'package:catalogo_web/modules/categories/core/factories/factories.dart';
import 'package:catalogo_web/modules/categories/domain/entities/category_entity.dart';
import 'package:catalogo_web/modules/categories/ui/pages/subcategories/subcategories.dart';

SubCategoriesPage makeSubCategoriesPage(CategoryEntity category) => SubCategoriesPage(
      presenter: makeSubCategoriesPresenter(category),
    );
