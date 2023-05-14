import 'package:damproject/config/config.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BusinessCardQrScreen extends StatelessWidget {
  const BusinessCardQrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarBackHome(title: businessScreenTitle, showBackButton: true),
      body: Center(
        child: Text('BusinessCardQrScreen'),
      ),
    );
  }
}