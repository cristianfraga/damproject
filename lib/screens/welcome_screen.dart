import 'package:damproject/config/config.dart';
import 'package:flutter/material.dart';

// This code defines the WelcomeScreen widget, which displays a welcome screen with animations and transitions to the next screen.
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Initializes the animation controller with a duration and vsync.
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    // Sets up a fade animation using an opacity tween and the animation controller.
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    // Starts the animation after a delay.
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    _animationController.forward();
  }

  @override
  void dispose() {
    // Disposes the animation controller to free up resources.
    _animationController.dispose();
    super.dispose();
  }

  void goToNextScreen() {
    // Navigates to the next screen using the Navigator.
    Navigator.pushReplacementNamed(context, 'check_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: goToNextScreen,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Displays the app logo image.
                Image.asset(appLogo, width: 200, height: 200),
                const SizedBox(height: 20),
                // Displays the app title text.
                const Text(appTitle,
                    style:
                        TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                // Displays the app slogan text.
                const Text(appSlogan, style: TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                // Displays the "Start Now" text.
                const Text(
                  startNow,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
