import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    this.msg = 'Parece que houve um erro na sua solicitação',
  });

  final String msg;

  @override
  Widget build(BuildContext context) {
    double maxWidth = 250;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: double.maxFinite,
        constraints: BoxConstraints(minHeight: 150, maxWidth: maxWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.error_outline, color: Colors.red, size: 35),
            const SizedBox(height: 20),
            const Text('Erro', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 2),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
