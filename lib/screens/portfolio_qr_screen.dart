import 'package:damproject/config/config.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PortfolioQrScreen extends StatelessWidget {
  const PortfolioQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarBackHome(title: portfolioScreenTitle, showBackButton: true),
      body: Center(
        child: Text('PortfolioQrScreen'),
      ),
    );
  }
}