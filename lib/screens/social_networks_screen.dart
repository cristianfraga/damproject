import 'package:damproject/config/config.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SocialNetworksScreen extends StatelessWidget {
  const SocialNetworksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarBackHome(title: socialNetworksScreenTitle, showBackButton: true),
      body: Center(
        child: Text('SocialNetworksScreen'),
      ),
    );
  }
}