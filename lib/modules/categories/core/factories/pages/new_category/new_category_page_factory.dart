import '../../../../ui/pages/new_category/new_category.dart';
import 'new_category_presenter_factory.dart';

NewCategoryPage makeNewCategoryPage() => NewCategoryPage(presenter: makeNewCategoryPresenter());
