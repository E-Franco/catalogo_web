import 'package:flutter/foundation.dart';

import '../ui/helpers/helpers.dart';

abstract class BasePresenter {
  abstract ValueNotifier<UIState> state;
  
  void init();
  void dispose();
}