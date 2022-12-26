import 'package:catalogo_web/common/common.dart';
import 'package:catalogo_web/modules/login/ui/login_presenter.dart';
import 'package:catalogo_web/modules/login/ui/login_web.dart';
import 'package:flutter/material.dart';

import 'login_page_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.presenter,
  });

  final LoginPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      desktop: LoginPageWeb(),
      mobile: LoginPageMobile(),
    );
  }
}
