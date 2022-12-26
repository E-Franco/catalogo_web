import 'package:catalogo_web/modules/products/domain/entities/entities.dart';
import 'package:flutter/foundation.dart';

import '../../../../../common/common.dart';
import '../../../../categories/domain/entities/entities.dart';

abstract class EditProductPresenter extends BasePresenter{
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

  abstract ProductEntity product;
  void changeProduct(ProductEntity value);

  Future<void> save();
  Future<void> delete();
  Future<void> fetchSubCategories();
}