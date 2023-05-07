import 'package:damproject/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DAM project App',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300]
      ),
      //TODO: Change the initialRoute to welcome_screen
      initialRoute: 'login_screen',
      routes: {
        'welcome_screen': (_) => const WelcomeScreen(),
        'login_screen'  : (_) => const LoginScreen(),
        'home_screen'   : (_) => const HomeScreen(),
      },
    );
  }
}