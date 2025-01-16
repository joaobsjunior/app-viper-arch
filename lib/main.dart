import 'package:viperarch/cases/signup/signup_context.dart';
import 'package:viperarch/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cases/home/home_context.dart';
import 'cases/login/login_context.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ViperArch());
}

class ViperArch extends StatelessWidget {
  const ViperArch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ViperArch App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.theme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginContext.create(context),
        '/home': (context) => HomeContext.create(context),
        '/signup': (context) => SignupContext.create(context),
      },
    );
  }
}
