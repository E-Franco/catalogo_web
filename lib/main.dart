import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/common.dart';
import 'modules/login/core/factories/pages/login_page_factory.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: EnvironmentVariables.apiKey,
      authDomain: EnvironmentVariables.authDomain,
      projectId: EnvironmentVariables.projectId,
      storageBucket: EnvironmentVariables.storageBucket,
      messagingSenderId: EnvironmentVariables.messagingSenderId,
      appId: EnvironmentVariables.appId,
      measurementId: EnvironmentVariables.measurementId,
    ),
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
      home: makeLoginPage(),
    );
  }
}
