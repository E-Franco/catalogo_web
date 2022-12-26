import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    const double fontSize = 18;
    const double iconSize = 28;

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ListTile(
        leading: Icon(icon, size: iconSize, color: Colors.white),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
