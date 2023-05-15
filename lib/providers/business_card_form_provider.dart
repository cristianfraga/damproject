import 'package:flutter/material.dart';

class BusinessCardFormProvider extends ChangeNotifier {
  String fullName = '';
  String profession = '';
  String contactPhone = '';
  String personalEmail = '';
  String personalWebsite = '';
  String address = '';

  void updateFullName(String value) {
    fullName = value;
    notifyListeners();
  }

  void updateProfession(String value) {
    profession = value;
    notifyListeners();
  }

  void updateContactPhone(String value) {
    contactPhone = value;
    notifyListeners();
  }

  void updatePersonalEmail(String value) {
    personalEmail = value;
    notifyListeners();
  }

  void updatePersonalWebsite(String value) {
    personalWebsite = value;
    notifyListeners();
  }

  void updateAddress(String value) {
    address = value;
    notifyListeners();
  }
}