import 'package:flutter/material.dart';

import '../../../core/utils/enums.dart';

class SignupFormNotifier extends ChangeNotifier {
  final ValueNotifier<bool> isFirstNameValid = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isLastNameValid = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isEmailValid = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isPasswordValid = ValueNotifier<bool>(true);

  void validateField(FieldType fieldName, String value) {
    bool isValid = value.isNotEmpty;

    switch (fieldName) {
      case FieldType.firstName:
        isFirstNameValid.value = isValid;
        break;
      case FieldType.lastName:
        isLastNameValid.value = isValid;
        break;
      case FieldType.email:
        isEmailValid.value = isValid;
        break;
      case FieldType.password:
        isPasswordValid.value = isValid;
        break;
    }
    notifyListeners();
  }

  void validateAllFields({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    validateField(FieldType.firstName, firstName);
    validateField(FieldType.lastName, lastName);
    validateField(FieldType.email, email);
    validateField(FieldType.password, password);
  }
}
