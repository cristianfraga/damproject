import 'package:damproject/config/colors.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String labelText,
    required String hintText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: rust,
            )
          : null,
      labelText: labelText,
      labelStyle: TextStyle(
        color: grey,
      ),
      hintText: hintText,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: rust,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: rust,
          width: 2,
        ),
      ),
    );
  }
}
