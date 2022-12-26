import '../../common.dart';
import '../../../modules/categories/core/factories/factories.dart';
import '../../../modules/products/core/factories/pages/pages.dart';
import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
        color: AppColors.primaryColor,
      ),
      child: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          children: <Widget>[
            // DrawerItem(
            //   label: 'Inicio',
            //   icon: Icons.home,
            //   onPressed: () {},
            // ),
            DrawerItem(
              label: 'Cadastrar Produto',
              icon: Icons.add_box,
              onPressed: () => Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return makeNewProductPage();
                  },
                ),
              ),
            ),
            DrawerItem(
              label: 'Produtos',
              icon: Icons.tag,
              onPressed: () => Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return makeProductsPage();
                  },
                ),
              ),
            ),
            DrawerItem(
              label: 'Categorias',
              icon: Icons.category,
              onPressed: () => Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return makeCategoriesPage();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
