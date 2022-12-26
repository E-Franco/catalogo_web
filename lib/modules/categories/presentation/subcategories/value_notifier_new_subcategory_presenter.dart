import 'package:flutter/foundation.dart';

import '../../../../common/ui/helpers/helpers.dart';
import '../../domain/usecases/subcategory/create_subcategory.dart';
import '../../ui/pages/new_subcategory/new_subcategory.dart';

class ValueNotifierNewSubCategoryPresenter implements NewSubCategoryPresenter{
  ValueNotifierNewSubCategoryPresenter({required this.createSubCategory,});

  final CreateSubCategory createSubCategory;


  @override
  late ValueNotifier<UIState> state;


  @override
  void init() {
    state = ValueNotifier<UIState>(UIState.initial);
  }

  @override
  Future<void> save(String name, String categoryId) async{
    state.value = UIState.loading;
    final result = await createSubCategory(name, categoryId);
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

}