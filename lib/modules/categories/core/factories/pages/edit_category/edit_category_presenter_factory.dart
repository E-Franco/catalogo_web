import '../../../../presentation/value_notifier.dart';
import '../../../../ui/pages/edit_category/edit_category.dart';
import '../../usecases/usecases.dart';

EditCategoryPresenter makeEditCategoryPresenter() => ValueNotifierEditCategoryPresenter(
      updateCategory: makeUpdateCategory(),
      deleteCategory: makeDeleteCategory(),
    );
