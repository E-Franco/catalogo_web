import '../../../../presentation/value_notifier_new_category_presenter.dart';
import '../../../../ui/pages/new_category/new_category.dart';
import '../../factories.dart';


NewCategoryPresenter makeNewCategoryPresenter() =>
    ValueNotifierNewCategoryPresenter(createCategory: makeCreateCategory());
