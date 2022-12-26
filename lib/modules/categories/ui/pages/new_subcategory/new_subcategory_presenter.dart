import '../../../../../common/presentation/base_presenter.dart';

abstract class NewSubCategoryPresenter extends BasePresenter{
  Future<void> save(String name, String categoryId);
}