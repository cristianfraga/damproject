import 'package:damproject/resources/resources.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarBackHome(title: portfolioScreenTitle, showBackButton: true),
      body: Center(
        child: Text('PortfolioScreen'),
      ),
    );
  }
}