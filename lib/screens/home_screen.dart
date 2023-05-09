import 'package:damproject/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.account_circle_rounded),
          leadingWidth: 100,
          title: const Text('Home Screen'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  final authService = Provider.of<AuthService>(context, listen: false);
                  authService.logout();
                  Navigator.pushReplacementNamed(context, 'login_screen');
                }, icon: const Icon(Icons.logout_outlined)),
          ]),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
