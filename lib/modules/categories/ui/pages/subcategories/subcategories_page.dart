import 'package:catalogo_web/common/common.dart';
import 'package:catalogo_web/modules/categories/ui/pages/subcategories/subcategories.dart';
import 'package:catalogo_web/modules/categories/ui/pages/subcategories/subcategories_page_mobile.dart';
import 'package:catalogo_web/modules/categories/ui/pages/subcategories/subcategories_page_web.dart';
import 'package:flutter/material.dart';

class SubCategoriesPage extends StatelessWidget {
  const SubCategoriesPage({
    super.key,
    required this.presenter,
  });

  final SubCategoriesPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: SubCategoriesPageWeb(presenter: presenter),
      mobile: SubCategoriesPageMobile(presenter: presenter),
    );
  }
}
