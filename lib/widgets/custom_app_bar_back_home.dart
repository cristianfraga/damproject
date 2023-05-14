import 'package:damproject/config/config.dart';
import 'package:damproject/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This code defines a custom app bar widget for displaying a title and optional back button.
// The app bar is implemented as a stateless widget and implements the PreferredSizeWidget to specify its size.
class CustomAppBarBackHome extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarBackHome(
      {Key? key, required this.title, this.showBackButton = false})
      : super(key: key);

  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : const Icon(Icons.account_circle_rounded),
      leadingWidth: 100,
      backgroundColor: cyan,
      title: Text(title),
      centerTitle: true,
      elevation: 2,
      actions: [
        IconButton(
          onPressed: () {
            final authService =
                Provider.of<AuthService>(context, listen: false);
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login_screen');
          },
          icon: const Icon(Icons.logout_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
