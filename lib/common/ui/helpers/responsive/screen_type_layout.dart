import 'package:flutter/material.dart';

import 'responsive.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget desktop;

  const ScreenTypeLayout({
    super.key,
    required this.desktop,
    this.mobile,
    this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceType == DeviceScreenType.mobile) {
          return mobile ?? desktop;
        }

        if (sizingInformation.deviceType == DeviceScreenType.tablet) {
          return tablet ?? desktop;
        }

        return desktop;
      },
    );
  }
}
