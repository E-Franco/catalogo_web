import 'package:flutter/foundation.dart';

import '../../../../../common/common.dart';
import '../../../domain/entities/entities.dart';

abstract class SubCategoriesPresenter implements BasePresenter{
  abstract CategoryEntity selectedCategory;
  abstract ValueNotifier<List<SubCategoryEntity>> subcategories;

  List<SubCategoryEntity> filterSubCategories(String filter);
  Future<void> fetchSubCategories();
}