import '../../../../domain/entities/entities.dart';
import '../../../../ui/pages/edit_category/edit_category.dart';
import 'edit_category_presenter_factory.dart';

EditCategoryPage makeEditCategoryPage(CategoryEntity entity) => EditCategoryPage(
      presenter: makeEditCategoryPresenter(),
      category: entity,
    );
