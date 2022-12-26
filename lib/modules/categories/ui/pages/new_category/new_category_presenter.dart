import '../../../../../common/presentation/base_presenter.dart';

abstract class NewCategoryPresenter extends BasePresenter{
  Future<void> save(String name);
}