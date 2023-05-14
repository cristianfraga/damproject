import 'package:damproject/resources/resources.dart';
import 'package:flutter/material.dart';

// This code defines a reusable CardContainer widget in Flutter.
class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // This method builds the CardContainer widget.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: _cardShape(),
        child: child,
      ),
    );
  }

  // Returns the BoxDecoration for the card shape.
  BoxDecoration _cardShape() => BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(color: black12, blurRadius: 15, offset: Offset(0, 5)),
        ],
      );
}
