import 'package:damproject/providers/providers.dart';
import 'package:damproject/resources/resources.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessCardQrScreen extends StatelessWidget {
  const BusinessCardQrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerForm = Provider.of<HeaderFormProvider>(context);
    final formProvider = Provider.of<BusinessCardFormProvider>(context);

    return Scaffold(
      appBar: const CustomAppBarBackHome(
        title: businessScreenTitle,
        showBackButton: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Full Name: ${headerForm.fullName}'),
            Text('Profession: ${headerForm.profession}'),
            Text('Contact Phone: ${formProvider.contactPhone}'),
            Text('Personal Email: ${formProvider.personalEmail}'),
            Text('Personal Website: ${formProvider.personalWebsite}'),
            Text('Address: ${formProvider.address}'),
          ],
        ),
      ),
    );
  }
}