import '../../../../presentation/value_notifier.dart';
import '../../../../ui/pages/pages.dart';
import '../../usecases/usecases.dart';

CategoriesPresenter makeCategoriesPresenter() => ValueNotifierCategoriesPresenter(
      getCategories: makeGetCategories(),
    );
