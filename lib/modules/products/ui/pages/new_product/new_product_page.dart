import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import 'new_product.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({
    super.key,
    required this.presenter,
  });

  final NewProductPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: NewProductPageWeb(presenter: presenter),
      mobile: NewProductPageMobile(presenter: presenter),
    );
  }
}
