import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../domain/entities/entities.dart';
import 'edit_product.dart';
import 'edit_product_page_mobile.dart';
import 'edit_product_page_web.dart';

class EditProductPage extends StatelessWidget {
  const EditProductPage({
    super.key,
    required this.presenter,
    required this.product,
  });

  final EditProductPresenter presenter;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: EditProductPageWeb(presenter: presenter, product: product),
      mobile: EditProductPageMobile(presenter: presenter, product: product),
    );
  }
}
