import 'package:damproject/config/colors.dart';
import 'package:damproject/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.account_circle_rounded),
      leadingWidth: 100,
      backgroundColor: cyan,
      title: Text(title),
      centerTitle: true,
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
