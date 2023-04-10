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
      title: 'Material App',
      theme: ThemeData.light(), // .dark() Tema oscuro.
      initialRoute: 'welcome_screen',
      routes: {
        'home_screen': (_) => const HomeScreen(),
        'welcome_screen': (_) => const WelcomeScreen(),
      },
    );
  }
}
