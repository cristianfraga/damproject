import 'package:damproject/config/config.dart';
import 'package:flutter/material.dart';

// This class represents the header avatar widget.
// It is a StatelessWidget, which means it doesn't hold any internal state.
// It displays a circular avatar with an icon representing a person.
class HeaderAvatar extends StatelessWidget {
  const HeaderAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    // The avatar is rendered as a Container widget with a CircleAvatar widget inside it.
    // It displays a circular background with an icon in the center.
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      child: CircleAvatar(
        backgroundColor: white.withOpacity(0.2),
        radius: 75,
        child: const Icon(Icons.person, color: white, size: 150),
      ),
    );
  }
}
