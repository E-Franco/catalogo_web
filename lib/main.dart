import 'package:catalogo_web/modules/login/presentation/value_notifier_login_presenter.dart';
import 'package:catalogo_web/modules/login/ui/login_page.dart';
import 'package:catalogo_web/modules/login/ui/login_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/common.dart';
import 'modules/products/core/factories/factories.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAV1ZW7CvzbOabBP448lmo32-iswgicMgE",
        authDomain: "parts-farm-paraguay.firebaseapp.com",
        projectId: "parts-farm-paraguay",
        storageBucket: "parts-farm-paraguay.appspot.com",
        messagingSenderId: "12399255991",
        appId: "1:12399255991:web:95558666d430555c55c832",
        measurementId: "G-JPE5Z5F5C3"),
  );
  setUp();
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parts Farm Paraguay',
      theme: Theme.of(context).copyWith(
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(),
        primaryColor: AppColors.primaryColor,
      ),
      home: LoginPage(presenter: ValueNotifierLoginPresenter()),
    );
  }
}
