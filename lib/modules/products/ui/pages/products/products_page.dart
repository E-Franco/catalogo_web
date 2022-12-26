import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import 'products.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
    required this.presenter,
  });

  final ProductsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: ProductsPageWeb(presenter: presenter),
      mobile: ProductsPageMobile(presenter: presenter),
    );
  }
}
