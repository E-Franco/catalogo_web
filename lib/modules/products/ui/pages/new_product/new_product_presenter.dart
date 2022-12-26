import 'package:catalogo_web/modules/categories/domain/entities/entities.dart';
import 'package:flutter/foundation.dart';

import '../../../../../common/common.dart';

abstract class NewProductPresenter extends BasePresenter{
  abstract ValueNotifier<CategoryEntity?> category;
  abstract ValueNotifier<SubCategoryEntity?> subcategory;
  abstract ValueNotifier<List<SubCategoryEntity>?> subcategories;

  void changeCategory(CategoryEntity value);

  abstract String? brand;
  void changeBrand(String value);


  abstract String? name;
  void changeName(String value);

  abstract String? code;
  void changeCode(String value);

  abstract ValueNotifier<Uint8List?> image;
  void changeImage(Uint8List value);

  Future<void> save();
  Future<void> fetchSubCategories();
}