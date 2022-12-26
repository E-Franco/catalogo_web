import 'package:catalogo_web/common/ui/helpers/ui_state.dart';
import 'package:catalogo_web/modules/login/ui/login_presenter.dart';
import 'package:flutter/foundation.dart';

class ValueNotifierLoginPresenter implements LoginPresenter{
  @override
  late ValueNotifier<UIState> state;

  @override
  Future<bool> auth() {
    
    throw UnimplementedError();
  }

  @override
  void dispose() {
    state.dispose();
  }

  @override
  void init() {
    state = ValueNotifier<UIState>(UIState.initial);
  }

}