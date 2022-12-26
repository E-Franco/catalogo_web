import 'package:flutter/foundation.dart';

import '../../../common/ui/helpers/helpers.dart';
import '../domain/usecases/usecases.dart';
import '../ui/pages/new_category/new_category.dart';

class ValueNotifierNewCategoryPresenter implements NewCategoryPresenter {
  ValueNotifierNewCategoryPresenter({
    required this.createCategory,
  });

  CreateCategory createCategory;

  @override
  late ValueNotifier<UIState> state;

  @override
  void init() {
    state = ValueNotifier<UIState>(UIState.initial);
  }

  @override
  Future<void> save(String name) async {
    state.value = UIState.loading;
    final result = await createCategory(name);
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
