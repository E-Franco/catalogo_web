import 'package:flutter/foundation.dart';

import '../../../../common/ui/helpers/ui_state.dart';
import '../../domain/entities/subcategory_entity.dart';
import '../../domain/usecases/subcategory/subcategory.dart';
import '../../ui/pages/edit_subcategory/edit_subcategory.dart';

class ValueNotifierEditSubCategoryPresenter implements EditSubCategoryPresenter {
  final UpdateSubCategory updateSubCategory;
  final DeleteSubCategory deleteSubCategory;

  ValueNotifierEditSubCategoryPresenter({
    required this.updateSubCategory,
    required this.deleteSubCategory,
    required this.subCategory,
  });

  @override
  late ValueNotifier<UIState> state;

  @override
  SubCategoryEntity subCategory;

  @override
  void dispose() {
    state.dispose();
  }

  @override
  void init() {
    state = ValueNotifier<UIState>(UIState.initial);
  }

  @override
  Future<void> save(String name, String categoryId) async {
    state.value = UIState.loading;
    final result = await updateSubCategory(subCategory.id, name, categoryId);
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
  Future<void> delete(String categoryId) async {
    state.value = UIState.loading;
    final result = await deleteSubCategory(subCategory.id, categoryId);
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
