import 'package:damproject/config/colors.dart';
import 'package:flutter/material.dart';

class HeaderAvatar extends StatelessWidget {
  const HeaderAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      child: CircleAvatar(
        backgroundColor: white.withOpacity(0.2),
        radius: 75,
        child: const Icon(
          Icons.person,
          color: white,
          size: 150,
        ),
      ),
    );
  }
}
