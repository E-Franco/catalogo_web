import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}