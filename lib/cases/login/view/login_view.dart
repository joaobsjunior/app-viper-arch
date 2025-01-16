import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Certifique-se de ter o pacote intl e rodar flutter pub get

import '../../../theme/theme_tokens.dart';
import '../presenter/login_presenter.dart';

class LoginView extends StatelessWidget {
  final LoginPresenter presenter;

  const LoginView({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ThemeTokens.paddingLarge),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.titleLogin,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: ThemeTokens.paddingLarge),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.labelEmail,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ThemeTokens.borderRadiusSmall),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [
                      AutofillHints.username,
                      AutofillHints.email
                    ],
                  ),
                  const SizedBox(height: ThemeTokens.paddingMedium),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.labelPassword,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ThemeTokens.borderRadiusSmall),
                      ),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    autofillHints: const [AutofillHints.password],
                  ),
                  const SizedBox(height: ThemeTokens.paddingLarge),
                  ElevatedButton(
                    onPressed: () {
                      presenter.loginWithEmailPassword(
                          emailController.text, passwordController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeTokens.primaryColor,
                      foregroundColor: ThemeTokens.secondaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: Text(AppLocalizations.of(context)!.labelLogin),
                  ),
                  const SizedBox(height: ThemeTokens.paddingLarge),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: ThemeTokens.primaryColor,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(width: ThemeTokens.paddingSmall),
                      Text(
                        AppLocalizations.of(context)!.labelOrLoginWith,
                        style: const TextStyle(
                          color: ThemeTokens.primaryColor,
                          fontSize: ThemeTokens.fontSizeBody,
                        ),
                      ),
                      const SizedBox(width: ThemeTokens.paddingSmall),
                      const Expanded(
                        child: Divider(
                          color: ThemeTokens.primaryColor,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: ThemeTokens.paddingLarge),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.email,
                        color: ThemeTokens.secondaryColor),
                    label: Text(AppLocalizations.of(context)!.labelLoginWithGmail),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeTokens.primaryColor,
                      foregroundColor: ThemeTokens.secondaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: presenter.loginWithGmail,
                  ),
                  const SizedBox(height: ThemeTokens.paddingMedium),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.facebook,
                        color: ThemeTokens.secondaryColor),
                    label: Text(AppLocalizations.of(context)!.labelLoginWithFacebook),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      foregroundColor: ThemeTokens.secondaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: presenter.loginWithFacebook,
                  ),
                  const SizedBox(height: ThemeTokens.paddingMedium),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.apple,
                        color: ThemeTokens.secondaryColor),
                    label: Text(AppLocalizations.of(context)!.labelLoginWithApple),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: ThemeTokens.secondaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: presenter.loginWithApple,
                  ),
                  const SizedBox(height: ThemeTokens.paddingLarge),
                  TextButton(
                    onPressed: presenter.signUp,
                    child: Text(
                      AppLocalizations.of(context)!.labelSignup,
                      style: const TextStyle(
                        color: ThemeTokens.primaryColor,
                        fontSize: ThemeTokens.fontSizeBody,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}