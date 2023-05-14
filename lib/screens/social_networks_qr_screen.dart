import 'package:damproject/resources/resources.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SocialNetworksQrScreen extends StatelessWidget {
  const SocialNetworksQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarBackHome(title: socialNetworksScreenTitle, showBackButton: true),
      body: Center(
        child: Text('SocialNetworksQrScreen'),
      ),
    );
  }
}