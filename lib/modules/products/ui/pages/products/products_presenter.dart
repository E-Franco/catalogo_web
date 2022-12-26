import 'package:flutter/foundation.dart';

import '../../../../../common/common.dart';
import '../../../domain/entities/entities.dart';

abstract class ProductsPresenter extends BasePresenter{
  abstract ValueNotifier<List<ProductEntity>> products;
  Future<void> fetchProducts();
  List<ProductEntity> filteredProducts(String filter);
}