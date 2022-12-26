import 'package:flutter/foundation.dart';

import '../../../common/ui/helpers/ui_state.dart';
import '../domain/entities/category_entity.dart';
import '../domain/usecases/category/category.dart';
import '../ui/pages/edit_category/edit_category_presenter.dart';

class ValueNotifierEditCategoryPresenter implements EditCategoryPresenter {
  ValueNotifierEditCategoryPresenter({
    required this.updateCategory,
    required this.deleteCategory,
  });

  final UpdateCategory updateCategory;
  final DeleteCategory deleteCategory;

  @override
  late ValueNotifier<UIState> state;

  @override
  void init() {
    state = ValueNotifier<UIState>(UIState.initial);
  }

  @override
  Future<void> save(CategoryEntity entity) async {
    state.value = UIState.loading;
    final result = await updateCategory(entity.id, entity.name);
    result.fold(
      (l) {
        state.value = UIState.error;
      },
      (r) {
        state.value = UIState.success;
      },
    );
  }

  @override
  void dispose() {
    state.dispose();
  }

  @override
  Future<void> delete(CategoryEntity entity) async {
    state.value = UIState.loading;
    final result = await deleteCategory(entity.id);
    result.fold(
      (l) {
        state.value = UIState.error;
      },
      (r) {
        state.value = UIState.success;
      },
    );
  }
}
