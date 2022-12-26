import '../../../../presentation/value_notifier.dart';
import '../../../../ui/pages/new_subcategory/new_subcategory.dart';
import '../../factories.dart';


NewSubCategoryPresenter makeNewSubCategoryPresenter() =>
    ValueNotifierNewSubCategoryPresenter(createSubCategory: makeCreateSubCategory());
