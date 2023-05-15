import 'package:damproject/providers/providers.dart';
import 'package:damproject/resources/resources.dart';
import 'package:damproject/screens/screens.dart';
import 'package:damproject/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This code sets up a Flutter application with providers for various services and state management classes.
// It defines the main widget of the application, configures the MaterialApp, and defines routes for different screens.

void main() => runApp(const AppState());

// This is the top-level widget of the application.
// It sets up the providers for various services and state management classes.
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => HeaderFormProvider()),
        ChangeNotifierProvider(create: (_) => BusinessCardFormProvider()),
      ],
      child: const MyApp(),
    );
  }
}

// This is the main widget of the application.
// It configures the MaterialApp and defines the routes for different screens.
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
        'business_card_screen' : (_) => const BusinessCardScreen(),
        'business_card_qr_screen' : (_) => const BusinessCardQrScreen(),
        'curriculum_screen' : (_) => const CurriculumScreen(),
        'curriculum_qr_screen' : (_) => const CurriculumQrScreen(),
        'portfolio_screen' : (_) => const PortfolioScreen(),
        'portfolio_qr_screen' : (_) => const PortfolioQrScreen(),
        'social_networks_screen' : (_) => const SocialNetworksScreen(),
        'social_networks_qr_screen' : (_) => const SocialNetworksQrScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      // theme: ThemeData.light().copyWith(), Defined a theme ?
    );
  }
}
