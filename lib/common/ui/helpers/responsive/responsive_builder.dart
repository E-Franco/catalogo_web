import 'package:flutter/material.dart';

import '../helpers.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, SizingInformation sizingInformation) builder;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      var sizingInformation = SizingInformation(
        screenSize: mediaQuery.size,
        deviceType: getDeviceType(mediaQuery),
        localWidgetSize: Size(
          constraints.maxWidth,
          constraints.maxHeight,
        ),
      );

      return builder(context, sizingInformation);
    });
  }
}
