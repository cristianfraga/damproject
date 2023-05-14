import 'dart:math';
import 'dart:ui';

import 'package:damproject/resources/resources.dart';
import 'package:flutter/material.dart';

// This code defines a Flutter widget called FullBackground that creates a full-screen background with gradient and animated bubbles.
class FullBackground extends StatelessWidget {
  final Widget child;

  const FullBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _GradientBackground(),
          _BubblesLayer(size: size),
          child,
        ],
      ),
    );
  }
}

// This widget represents the gradient background layer.
class _GradientBackground extends StatelessWidget {
  const _GradientBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [blue.withOpacity(0.2), cyan.withOpacity(0.2)],
        ),
      ),
    );
  }
}

// This widget represents the layer of animated bubbles.
class _BubblesLayer extends StatelessWidget {
  final Size size;

  const _BubblesLayer({required this.size});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: List.generate(20, (index) {
          final bubbleSize = Random().nextInt(50) + 50.0;
          final bubblePosition = Offset(
            Random().nextDouble() * size.width,
            Random().nextDouble() * size.height,
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

// This widget represents an individual bubble.
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
