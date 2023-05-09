import 'package:flutter/material.dart';

// This class contains the logic for the login form.
// It extends the ChangeNotifier class so it can notify its listeners when
// any properties within it change.

class LoginFormProvider extends ChangeNotifier {
  // This key is used to identify the form and access its properties.
  // It's used to validate the form and to get the values of its inputs.
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // These are the email and password inputs.
  String email = '';
  String password = '';

  // This flag is used to determine if the form is currently submitting.
  bool _isLoading = false;

  // This getter is used to get the value of the isLoading flag.
  bool get isLoading => _isLoading;

  // This setter is used to update the value of the isLoading flag and
  // notify any listeners that the value has changed.
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // This function is used to check if the form is valid. It returns true if
  // the form is valid and false otherwise.
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
