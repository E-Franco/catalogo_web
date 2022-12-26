import 'package:flutter/foundation.dart';

import '../../../common/ui/helpers/ui_state.dart';
import '../domain/entities/category_entity.dart';
import '../domain/usecases/category/get_categories.dart';
import '../ui/pages/pages.dart';

class ValueNotifierCategoriesPresenter implements CategoriesPresenter {
  ValueNotifierCategoriesPresenter({
    required this.getCategories,
  });

  GetCategories getCategories;

  @override
  late ValueNotifier<List<CategoryEntity>> categories;

  @override
  late ValueNotifier<UIState> state;

  @override
  void init() {
    categories = ValueNotifier([]);
    state = ValueNotifier(UIState.initial);
    fetchCategories();
  }

  @override
  void dispose() {
    state.dispose();
    categories.dispose();
  }

  @override
  Future<void> fetchCategories() async {
    setState(UIState.loading);
    final result = await getCategories();
    result.fold((l) {
      setState(UIState.error);
    }, (r) {
      categories.value = r;
      setState(UIState.success);
    });
  }

  void setState(UIState newState) {
    if (state.value != UIState.inactive) state.value = newState;
  }
  
  @override
  List<CategoryEntity> filterCategories(String filter) {
    return categories.value
        .where(
          (CategoryEntity p) => p.name.trim().toLowerCase().contains(filter.trim().toLowerCase()),
        )
        .toList();
  }
}
