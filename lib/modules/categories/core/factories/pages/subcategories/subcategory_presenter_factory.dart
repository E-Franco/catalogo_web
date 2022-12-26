import 'package:catalogo_web/modules/categories/core/factories/factories.dart';
import 'package:catalogo_web/modules/categories/domain/entities/category_entity.dart';
import 'package:catalogo_web/modules/categories/presentation/subcategories/value_notifier_subcategories_presenter.dart';
import 'package:catalogo_web/modules/categories/ui/pages/subcategories/subcategories.dart';

SubCategoriesPresenter makeSubCategoriesPresenter(CategoryEntity category) => ValueNotifierSubCategoriesPresenter(
      selectedCategory: category,
      getSubCategories: makeGetSubCategories(),
    );
