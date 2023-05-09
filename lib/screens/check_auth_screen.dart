import 'package:damproject/screens/screens.dart';
import 'package:damproject/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//This widget is responsible for checking the user authentication status.
//If the user is authenticated, it navigates to the HomeScreen.
//If the user is not authenticated, it navigates to the LoginScreen.

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the AuthService instance from the Provider.
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            // Show a loading indicator if the future hasn't completed yet.
            if (!snapshot.hasData) return const CircularProgressIndicator();
            // Show an error icon if the future failed.
            if (snapshot.hasError) return const Icon(Icons.error_outline);
            // If there is no token, navigate to the LoginScreen.
            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const LoginScreen(),
                      transitionDuration: const Duration(seconds: 0)),
                );
              });
              // If there is a token, navigate to the HomeScreen.
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const HomeScreen(),
                      transitionDuration: const Duration(seconds: 0)),
                );
              });
            }
            // Return an empty container as we don't need to show anything.
            return Container();
          },
        ),
      ),
    );
  }
}
