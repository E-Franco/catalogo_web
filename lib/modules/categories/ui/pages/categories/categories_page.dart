import 'package:catalogo_web/common/common.dart';
import 'package:catalogo_web/modules/categories/ui/pages/categories/categories.dart';
import 'package:catalogo_web/modules/categories/ui/pages/categories/categories_page_mobile.dart';
import 'package:catalogo_web/modules/categories/ui/pages/categories/categories_page_web.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({
    super.key,
    required this.presenter,
  });

  final CategoriesPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: CategoriesPageWeb(presenter: presenter),
      mobile: CategoriesPageMobile(presenter: presenter),
    );
  }
}
