import 'package:catalogo_web/modules/categories/domain/entities/entities.dart';

import '../../../../ui/pages/new_subcategory/new_subcategory.dart';
import 'new_subcategory_presenter_factory.dart';

NewSubCategoryPage makeNewSubCategoryPage(CategoryEntity category) => NewSubCategoryPage(
      presenter: makeNewSubCategoryPresenter(),
      category: category,
    );
