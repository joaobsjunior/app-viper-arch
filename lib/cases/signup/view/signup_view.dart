import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/utils/enums.dart';
import '../../../theme/theme_tokens.dart';
import '../notifier/signup_form_notifier.dart';
import '../presenter/signup_presenter.dart';

class SignupView extends StatelessWidget {
  final SignupPresenter presenter;
  final SignupFormNotifier formNotifier = SignupFormNotifier();

  SignupView({super.key, required this.presenter});

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _dateOfBirthFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  // Adicione FocusNodes para cada campo
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _dateOfBirthFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleSignup),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(ThemeTokens.paddingLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: formNotifier.isFirstNameValid,
                builder: (context, isValid, child) {
                  return TextField(
                    focusNode: _firstNameFocusNode,
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.labelFirstName,
                      hintText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ThemeTokens.borderRadiusSmall),
                      ),
                      errorText: isValid
                          ? null
                          : AppLocalizations.of(context)!.fieldRequired,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                          isValid ? ThemeTokens.primaryColor : Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(
                            ThemeTokens.borderRadiusSmall),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) =>
                        formNotifier.validateField(FieldType.firstName, value),
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_lastNameFocusNode),
                  );
                },
              ),
              const SizedBox(height: ThemeTokens.paddingMedium),
              ValueListenableBuilder<bool>(
                valueListenable: formNotifier.isLastNameValid,
                builder: (context, isValid, child) {
                  return TextField(
                    focusNode: _lastNameFocusNode,
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.labelLastName,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ThemeTokens.borderRadiusSmall),
                      ),
                      errorText: isValid
                          ? null
                          : AppLocalizations.of(context)!.fieldRequired,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                          isValid ? ThemeTokens.primaryColor : Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(
                            ThemeTokens.borderRadiusSmall),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) =>
                        formNotifier.validateField(FieldType.lastName, value),
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_emailFocusNode),
                  );
                },
              ),
              const SizedBox(height: ThemeTokens.paddingMedium),
              ValueListenableBuilder<bool>(
                valueListenable: formNotifier.isEmailValid,
                builder: (context, isValid, child) {
                  return TextField(
                    focusNode: _emailFocusNode,
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.labelEmail,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ThemeTokens.borderRadiusSmall),
                      ),
                      errorText: isValid
                          ? null
                          : AppLocalizations.of(context)!.fieldRequired,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                          isValid ? ThemeTokens.primaryColor : Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(
                            ThemeTokens.borderRadiusSmall),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) =>
                        formNotifier.validateField(FieldType.email, value),
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                  );
                },
              ),
              const SizedBox(height: ThemeTokens.paddingMedium),
              ValueListenableBuilder<bool>(
                valueListenable: formNotifier.isPasswordValid,
                builder: (context, isValid, child) {
                  return TextField(
                    focusNode: _passwordFocusNode,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.labelPassword,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ThemeTokens.borderRadiusSmall),
                      ),
                      errorText: isValid
                          ? null
                          : AppLocalizations.of(context)!.fieldRequired,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                          isValid ? ThemeTokens.primaryColor : Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(
                            ThemeTokens.borderRadiusSmall),
                      ),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) =>
                        formNotifier.validateField(FieldType.password, value),
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_dateOfBirthFocusNode),
                  );
                },
              ),
              const SizedBox(height: ThemeTokens.paddingMedium),
              TextField(
                focusNode: _dateOfBirthFocusNode,
                inputFormatters: [_dateOfBirthFormatter],
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.labelDateOfBirth,
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(ThemeTokens.borderRadiusSmall),
                  ),
                ),
                keyboardType: TextInputType.number,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
              ),
              const SizedBox(height: ThemeTokens.paddingLarge),
              ElevatedButton(
                onPressed: () {
                  formNotifier.validateAllFields(
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  presenter.submitSignupForm(
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    dateOfBirth: _dateOfBirthFormatter.getUnmaskedText(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeTokens.primaryColor,
                  foregroundColor: ThemeTokens.secondaryColor,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(AppLocalizations.of(context)!.labelSignup),
              ),
            ],
          ),
        ),
      ),
    );
  }
}