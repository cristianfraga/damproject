import 'package:damproject/resources/resources.dart';
import 'package:flutter/material.dart';

// This code defines a class called InputDecorations that provides a static method for creating input decoration styles for authentication forms.
class InputDecorations {
  // This static method returns an InputDecoration object with the specified properties for authentication forms.
  static InputDecoration authInputDecoration({
    required String labelText,
    required String hintText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: rust) : null,
      labelText: labelText,
      labelStyle: TextStyle(color: grey),
      hintText: hintText,
      enabledBorder:
          const UnderlineInputBorder(borderSide: BorderSide(color: rust)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: rust, width: 2)),
    );
  }
}
