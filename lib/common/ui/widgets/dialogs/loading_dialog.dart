import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String msg;
  const LoadingDialog({
    super.key,
    this.msg = 'Carregando',
  });

  @override
  Widget build(BuildContext context) {
    double maxWidth = 250;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(minHeight: 150, maxWidth: maxWidth),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Text(msg, style: const TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }
}
