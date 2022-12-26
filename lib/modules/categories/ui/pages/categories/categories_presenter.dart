import 'package:flutter/foundation.dart';

import '../../../../../common/presentation/base_presenter.dart';
import '../../../domain/entities/category_entity.dart';

abstract class CategoriesPresenter extends BasePresenter{
   abstract ValueNotifier<List<CategoryEntity>> categories;
   Future<void> fetchCategories();
   List<CategoryEntity> filterCategories(String filter);
}
