import 'package:flutter/foundation.dart';

import '../../../common/ui/helpers/helpers.dart';
import '../domain/entities/entities.dart';
import '../domain/usecases/usecases.dart';
import '../ui/pages/products/products.dart';

class ValueNotifierProductsPresenter implements ProductsPresenter {
  ValueNotifierProductsPresenter({
    required this.getProducts,
  });

  final GetProducts getProducts;

  @override
  late ValueNotifier<UIState> state;

  @override
  late ValueNotifier<List<ProductEntity>> products;

  @override
  Future<void> fetchProducts() async {
    setState(UIState.loading);
    final result = await getProducts();
    result.fold((l) {
      setState(UIState.error);
    }, (r) {
      products.value = r;
      setState(UIState.success);
    });
  }

  @override
  void init() {
    state = ValueNotifier<UIState>(UIState.initial);
    products = ValueNotifier<List<ProductEntity>>([]);
    fetchProducts();
  }

  @override
  void dispose() {
    state.dispose();
    products.dispose();
  }

  void setState(UIState newState) {
    if (state.value != UIState.inactive) state.value = newState;
  }

  @override
  List<ProductEntity> filteredProducts(String filter) {
    return products.value
        .where(
          (ProductEntity p) => p.name.trim().toLowerCase().contains(filter.trim().toLowerCase()),
        )
        .toList();
  }
}
