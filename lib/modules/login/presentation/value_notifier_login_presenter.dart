import 'package:catalogo_web/common/ui/helpers/ui_state.dart';
import 'package:catalogo_web/modules/login/domain/usecases/make_auth.dart';
import 'package:catalogo_web/modules/login/ui/login_presenter.dart';
import 'package:flutter/foundation.dart';

class ValueNotifierLoginPresenter implements LoginPresenter {
  ValueNotifierLoginPresenter({
    required this.makeAuth,
  });

  final MakeAuth makeAuth;

  @override
  late ValueNotifier<UIState> state;

  @override
  String? username;

  @override
  void changeUsername(String value) {
    username = value.trim().toLowerCase();
  }

  @override
  String? password;

  @override
  void changePassword(String value) => password = value;

  @override
  Future<bool> auth() async {
    setState(UIState.loading);
    final result = await makeAuth(username!, password!);
    result.fold(
      (l) {
        setState(UIState.error);
      },
      (r) {
        setState(UIState.success);
      },
    );

    return result.isRight();
  }

  @override
  void dispose() {
    state.dispose();
  }

  @override
  void init() {
    state = ValueNotifier<UIState>(UIState.initial);
  }

  void setState(UIState newState) {
    if (state.value != UIState.inactive) state.value = newState;
  }
}
