import 'dart:ui';

import 'package:damproject/config/colors.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
          const Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: HeaderAvatar(),
          ),
          child,
        ],
      ),
    );
  }

}

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
        children: const [
          Positioned(
            top: 90,
            left: 30,
            child: _Bubble(),
          ),
          Positioned(
            top: -40,
            left: -30,
            child: _Bubble(),
          ),
          Positioned(
            top: -50,
            right: -20,
            child: _Bubble(),
          ),
          Positioned(
            bottom: -50,
            left: 100,
            child: _Bubble(),
          ),
          Positioned(
            bottom: 120,
            right: 20,
            child: _Bubble(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _colorDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            blue,
            cyan,
          ],
        ),
      );
}

class _Bubble extends StatelessWidget {
  const _Bubble();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
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
