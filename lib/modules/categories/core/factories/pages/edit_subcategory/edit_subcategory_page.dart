import 'package:catalogo_web/modules/categories/core/factories/factories.dart';
import 'package:catalogo_web/modules/categories/domain/entities/entities.dart';
import 'package:catalogo_web/modules/categories/ui/pages/edit_subcategory/edit_subcategory.dart';

EditSubCategoryPage makeEditSubCategoriesPage(SubCategoryEntity subCategory) => EditSubCategoryPage(
      presenter: makeEditSubCategoryPresenter(subCategory),
    );
