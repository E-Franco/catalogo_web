import '../../../../../common/common.dart';
import '../../../domain/entities/entities.dart';

abstract class EditSubCategoryPresenter extends BasePresenter {
  abstract SubCategoryEntity subCategory;
  Future<void> save(String name, String categoryId);
  Future<void> delete(String categoryId);
}
