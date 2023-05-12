import 'package:damproject/config/colors.dart';
import 'package:damproject/config/strings.dart';
import 'package:damproject/providers/providers.dart';
import 'package:damproject/screens/screens.dart';
import 'package:damproject/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => HomeFormProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (_) => const WelcomeScreen(),
        'login_screen': (_) => const LoginScreen(),
        'register_screen': (_) => const RegisterScreen(),
        'check_screen': (_) => const CheckAuthScreen(),
        'home_screen': (_) => const HomeScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: grey,
          appBarTheme: const AppBarTheme(elevation: 0, color: indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: indigo, elevation: 0)),
    );
  }
}
