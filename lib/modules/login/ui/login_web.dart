import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../common/common.dart';
import '../../products/core/factories/factories.dart';
import 'login_presenter.dart';

class LoginPageWeb extends StatefulWidget {
  const LoginPageWeb({
    super.key,
    required this.presenter,
  });

  final LoginPresenter presenter;

  @override
  LoginPageWebState createState() => LoginPageWebState();
}

class LoginPageWebState extends State<LoginPageWeb> {
  
  late GlobalKey<FormState> _formKey;
  late FocusNode _passwordFocus;

  @override
  void initState() {
    widget.presenter.init();
    _formKey = GlobalKey<FormState>();
    _passwordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/2.png',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black54),
          Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: 500,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      style: const TextStyle(fontSize: 20),
                      validator: RequiredValidator(errorText: Labels.requiredField),
                      onChanged: widget.presenter.changeUsername,
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_passwordFocus),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Usuário',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      focusNode: _passwordFocus,
                      onChanged: widget.presenter.changePassword,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Senha',
                      ),
                      onFieldSubmitted: (_) => auth(),
                      validator: RequiredValidator(errorText: Labels.requiredField),
                    ),
                    const SizedBox(height: 30),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          height: 50,
                          width: constraints.maxWidth / 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: auth,
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void auth() {
    if (_formKey.currentState!.validate()) {
      showDialog(context: context, builder: (_) => const LoadingDialog(msg: 'Autenticando'));

      widget.presenter.auth().whenComplete(() {
        Navigator.of(context).pop();
        Future.delayed(const Duration(milliseconds: 200)).whenComplete(() {
          if (widget.presenter.state.value == UIState.success) {
            Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, a, b) => makeProductsPage()));
          } else {
            showDialog(context: context, builder: (_) => const ErrorDialog(msg: 'Usuário e/ou senha incorretos'));
          }
        });
      });
    }
  }
}
