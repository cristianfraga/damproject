import 'package:damproject/providers/providers.dart';
import 'package:damproject/resources/resources.dart';
import 'package:damproject/ui/ui.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessCardScreen extends StatelessWidget {
  const BusinessCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the HeaderFormProvider instance using Provider.of.
    final headerForm = Provider.of<HeaderFormProvider>(context, listen: false);
    final formProvider = Provider.of<BusinessCardFormProvider>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBarBackHome(
          title: businessScreenTitle, showBackButton: true),
      body: FullBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderAvatar(),
              const SizedBox(height: 10),
              _buildInputField(
                context,
                // If fullName is not empty, use its value; otherwise, use fullNameHint.
                headerForm.fullName.isNotEmpty
                    ? headerForm.fullName
                    : fullNameHint,
                24,
                (value) {
                  // Update the fullName property of the HeaderFormProvider.
                  headerForm.fullName = value;
                },
              ),
              const SizedBox(height: 5),
              _buildInputField(
                context,
                // If profession is not empty, use its value; otherwise, use professionHint.
                headerForm.profession.isNotEmpty
                    ? headerForm.profession
                    : professionHint,
                20,
                (value) {
                  // Update the profession property of the HeaderFormProvider.
                  headerForm.profession = value;
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextFormField(
                      decoration: InputDecorations.inputDecoration(
                        labelText: contactPhoneInput,
                        hintText: contactPhoneInput,
                        prefixIcon: Icons.phone,
                      ),
                      onChanged: (value) {
                        formProvider.updateContactPhone(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextFormField(
                      decoration: InputDecorations.inputDecoration(
                        labelText: personalEmailInput,
                        hintText: personalEmailInput,
                        prefixIcon: Icons.email,
                      ),
                      onChanged: (value) {
                        formProvider.updatePersonalEmail(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextFormField(
                      decoration: InputDecorations.inputDecoration(
                        labelText: personalWebsiteInput,
                        hintText: personalWebsiteInput,
                        prefixIcon: Icons.language,
                      ),
                      onChanged: (value) {
                        formProvider.updatePersonalWebsite(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: TextFormField(
                        decoration: InputDecorations.inputDecoration(
                          labelText: addressInput,
                          hintText: addressInput,
                          prefixIcon: Icons.place,
                        ),
                        maxLines: 5,
                        onChanged: (value) {
                          formProvider.updateAddress(value);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Image.asset(mapImage, width: 100, height: 120),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 160),
            ],
          ),
        ),
      ),
    );
  }

  // A helper method to build an input field widget.
  Widget _buildInputField(
    BuildContext context,
    String hint,
    double fontSize,
    Function(String) onChanged,
  ) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(
          color: white,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          shadows: const [
            Shadow(color: black, offset: Offset(1, 1), blurRadius: 3),
          ],
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle:
              TextStyle(color: white.withOpacity(0.5), shadows: const []),
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}