import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    this.msg = 'Salvo!',
  });

  final String msg;

  @override
  Widget build(BuildContext context) {
    double maxWidth = 250;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: double.maxFinite,
        constraints: BoxConstraints(minHeight: 150, maxWidth: maxWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.check, color: Colors.green, size: 35),
            const SizedBox(height: 20),
            Text(msg, style: const TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
