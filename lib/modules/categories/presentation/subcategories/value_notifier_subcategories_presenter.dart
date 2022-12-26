import 'package:catalogo_web/common/common.dart';
import 'package:catalogo_web/modules/categories/domain/usecases/subcategory/get_subcategories.dart';
import 'package:catalogo_web/modules/categories/infra/models/category_model.dart';
import 'package:catalogo_web/modules/categories/ui/pages/categories/categories.dart';
import 'package:catalogo_web/service_locator.dart';
import 'package:flutter/foundation.dart';

import '../../../../common/ui/helpers/ui_state.dart';
import '../../domain/entities/entities.dart';
import '../../ui/pages/subcategories/subcategories.dart';

class ValueNotifierSubCategoriesPresenter implements SubCategoriesPresenter {
  ValueNotifierSubCategoriesPresenter({
    required this.selectedCategory,
    required this.getSubCategories,
  });

  final GetSubCategories getSubCategories;

  @override
  late CategoryEntity selectedCategory;

  @override
  late ValueNotifier<List<SubCategoryEntity>> subcategories;

  @override
  late ValueNotifier<UIState> state;

  @override
  void init() {
    state = ValueNotifier<UIState>(UIState.initial);
    subcategories = ValueNotifier<List<SubCategoryEntity>>([]);
    fetchSubCategories();
  }

  @override
  @override
  List<SubCategoryEntity> filterSubCategories(String filter) {
    return subcategories.value
        .where(
          (SubCategoryEntity p) => p.name.trim().toLowerCase().contains(filter.trim().toLowerCase()),
        )
        .toList();
  }

  @override
  void dispose() {
    state.dispose();
  }

  @override
  Future<void> fetchSubCategories() async {
    setState(UIState.loading);
    final result = await getSubCategories(selectedCategory.id);
    result.fold((l) {
      setState(UIState.error);
    }, (r) {
      subcategories.value = r;
      updateSubCategories();
      setState(UIState.success);
    });
  }

  void setState(UIState newState) {
    if (state.value != UIState.inactive) state.value = newState;
  }

  void updateSubCategories() {
    try {
      final categories = serviceLocator.get<CategoriesPresenter>().categories.value;
      int index = categories.indexWhere((e) => e.id == selectedCategory.id);

      final category = CategoryModel(
        id: selectedCategory.id,
        name: selectedCategory.name,
        subcategories: subcategories.value,
      );

      categories[index] = category;
      serviceLocator.get<CategoriesPresenter>().categories.value = categories;
    } catch (e) {
      setState(UIState.error);
    }
  }
}
