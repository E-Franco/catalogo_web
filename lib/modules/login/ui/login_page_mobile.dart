import 'package:catalogo_web/modules/products/core/factories/factories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../common/common.dart';

class LoginPageMobile extends StatefulWidget {
  const LoginPageMobile({super.key});

  @override
  LoginPageMobileState createState() => LoginPageMobileState();
}

class LoginPageMobileState extends State<LoginPageMobile> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;
  late FocusNode _passwordFocus;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
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
                      controller: _usernameController,
                      style: const TextStyle(fontSize: 20),
                      validator: RequiredValidator(errorText: Labels.requiredField),
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
                      controller: _passwordController,
                      obscureText: true,
                      focusNode: _passwordFocus,
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

  Future<void> auth() async {
    if (_formKey.currentState!.validate()) {
      showDialog(context: context, builder: (_) => const LoadingDialog(msg: 'Autenticando'));
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('auth').doc('admin').get();
      var data = doc.data() as Map<String, dynamic>;

      String user = _usernameController.text.trim().toLowerCase();
      String password = _passwordController.text;

      Navigator.of(context).pop();
      await Future.delayed(const Duration(milliseconds: 200));
      if (user == data['user'].toLowerCase() && password == data['password']) {
        Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, a, b) => makeProductsPage()));
      } else {
        showDialog(context: context, builder: (_) => ErrorDialog(msg: 'Usuário e/ou senha incorretos'));
      }
    }
  }
}
