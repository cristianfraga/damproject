import 'dart:math';
import 'dart:ui';

import 'package:damproject/config/colors.dart';
import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  final Widget child;

  const HomeBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _GradientBackground(),
          child,
        ],
      ),
    );
  }
}

class _GradientBackground extends StatelessWidget {
  const _GradientBackground();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            blue,
            cyan,
          ],
        ),
      ),
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
}

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
          child: Container(
            color: white.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
