import 'package:flutter/material.dart';

// This class represents the logic for managing a header form.
// It extends the ChangeNotifier class to notify its listeners when properties change.

class HeaderFormProvider extends ChangeNotifier {
  late String _fullName = '';  // Variable to store the full name
  late String _profession = '';  // Variable to store the profession

  // Getter for the full name
  String get fullName {
    return _fullName;
  }

  // Setter for the full name
  set fullName(String name) {
    _fullName = name;
    notifyListeners();  // Notify listeners that the value has changed
  }

  // Getter for the profession
  String get profession {
    return _profession;
  }

  // Setter for the profession
  set profession(String profession) {
    _profession = profession;
    notifyListeners();  // Notify listeners that the value has changed
  }
}