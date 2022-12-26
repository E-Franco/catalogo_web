import 'package:flutter/widgets.dart';

import 'responsive.dart';

class SizingInformation {
  const SizingInformation({
    required this.deviceType,
    required this.localWidgetSize,
    required this.screenSize,
  });

  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  @override
  String toString() {
    return "DeviceType: $deviceType, ScreenSize: $screenSize, LocalSize: $localWidgetSize";
  }
}
