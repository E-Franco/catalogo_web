import 'package:flutter/material.dart';

import 'helpers.dart';

double widthPercent(double size, BuildContext context){
  return MediaQuery.of(context).size.width * (size / 100);
}

double heightPercent(double size, BuildContext context){
  return MediaQuery.of(context).size.height * (size / 100);
}

DeviceScreenType getDeviceType(MediaQueryData mediaQuery){
  double shortestSide = mediaQuery.size.shortestSide;

  if(shortestSide >= 950){
    return DeviceScreenType.desktop;
  } else if(shortestSide >= 600){
    return DeviceScreenType.tablet;
  } else{
    return DeviceScreenType.mobile;
  }
}