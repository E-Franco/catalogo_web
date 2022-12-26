import 'package:catalogo_web/modules/categories/domain/entities/entities.dart';

import '../../../../presentation/value_notifier.dart';
import '../../../../ui/pages/edit_subcategory/edit_subcategory.dart';
import '../../factories.dart';

EditSubCategoryPresenter makeEditSubCategoryPresenter(SubCategoryEntity subCategory) => ValueNotifierEditSubCategoryPresenter(
      updateSubCategory: makeUpdateSubCategory(),
      deleteSubCategory: makeDeleteSubCategory(),
      subCategory: subCategory,
    );
