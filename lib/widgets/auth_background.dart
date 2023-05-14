import 'dart:math';
import 'dart:ui';

import 'package:damproject/resources/resources.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';

// This widget represents a background for authentication screens.
// It displays a colorful gradient box with floating bubbles and an optional child widget.
class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _ColorBox(),
          const Positioned(top: 30, left: 0, right: 0, child: HeaderAvatar()),
          child,
        ],
      ),
    );
  }
}

// This widget represents the colorful gradient box in the background.
// It generates and positions a set of floating bubbles on top of the box.
class _ColorBox extends StatelessWidget {
  const _ColorBox();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _colorDecoration(),
      child: Stack(
        children: List.generate(5, (index) {
          final bubbleSize = Random().nextInt(50) + 50.0;
          final bubblePosition = Offset(
            Random().nextDouble() * size.width,
            Random().nextDouble() * (size.height * 0.4 - bubbleSize),
          );

          return Positioned(
            top: bubblePosition.dy,
            left: bubblePosition.dx,
            child: _Bubble(size: bubbleSize),
          );
        }),
      ),
    );
  }

  // Generates the gradient decoration for the color box.
  BoxDecoration _colorDecoration() =>
      const BoxDecoration(gradient: LinearGradient(colors: [blue, cyan]));
}

// This widget represents a floating bubble on the color box.
class _Bubble extends StatelessWidget {
  final double size;

  const _Bubble({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: white.withOpacity(0.05),
        boxShadow: [
          BoxShadow(
            color: white.withOpacity(0.2),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: white.withOpacity(0.2)),
        ),
      ),
    );
  }
}
