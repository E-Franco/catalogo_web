import '../../../../../common/common.dart';
import '../../../domain/entities/entities.dart';

abstract class EditCategoryPresenter extends BasePresenter{
  Future<void> save(CategoryEntity entity);
  Future<void> delete(CategoryEntity entity);
}