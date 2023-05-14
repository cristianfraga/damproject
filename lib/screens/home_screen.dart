import 'package:damproject/config/config.dart';
import 'package:damproject/providers/providers.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtain an instance of HeaderFormProvider using the Provider.of() method.
    final headerForm = Provider.of<HeaderFormProvider>(context);
    // Build the UI for the HomeScreen.
    return Scaffold(
      appBar: const CustomAppBarBackHome(
        title: homeScreenTitle,
        showBackButton: false,
      ),
      body: HomeBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderAvatar(),
              const SizedBox(height: 20),
              _buildInputField(
                context,
                // If headerForm.fullName is not empty, use its value; otherwise, use fullNameHint.
                headerForm.fullName.isNotEmpty
                    ? headerForm.fullName
                    : fullNameHint,
                24,
              ),
              _buildInputField(
                context,
                // If headerForm.profession is not empty, use its value; otherwise, use professionHint.
                headerForm.profession.isNotEmpty
                    ? headerForm.profession
                    : professionHint,
                20,
              ),
              const SizedBox(height: 70),
              _buildButtonRow(
                businessCardButton,
                Icons.qr_code,
                context,
                'business_card_screen',
                'business_card_qr_screen',
              ),
              const SizedBox(height: 10),
              _buildButtonRow(
                curriculumButton,
                Icons.qr_code,
                context,
                'curriculum_screen',
                'curriculum_qr_screen',
              ),
              const SizedBox(height: 10),
              _buildButtonRow(
                portfolioButton,
                Icons.qr_code,
                context,
                'portfolio_screen',
                'portfolio_qr_screen',
              ),
              const SizedBox(height: 10),
              _buildButtonRow(
                socialNetworksButton,
                Icons.qr_code,
                context,
                'social_networks_screen',
                'social_networks_qr_screen',
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  // Build an input field widget.
  Widget _buildInputField(BuildContext context, String hint, double fontSize) {
    // Obtain an instance of HeaderFormProvider using the Provider.of() method.
    var formData = Provider.of<HeaderFormProvider>(context);

    return SizedBox(
      height: 40,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(
          color: white,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          shadows: const [
            Shadow(
              color: black,
              offset: Offset(1, 1),
              blurRadius: 3,
            ),
          ],
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: white.withOpacity(0.5),
            shadows: const [],
          ),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (hint == fullNameHint) {
            formData.fullName = value;
          } else if (hint == professionHint) {
            formData.profession = value;
          }
        },
      ),
    );
  }

  // Build a row of buttons.
  Widget _buildButtonRow(String text, IconData icon, BuildContext context,
      String routeName, String qrRouteName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(routeName);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: brown,
            minimumSize: const Size(200, 50),
            elevation: 3,
            foregroundColor: yellow,
          ),
          child: Text(text),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pushNamed(qrRouteName);
          },
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(50, 50),
              backgroundColor: transparent,
              shadowColor: transparent),
          icon: Icon(
            icon,
            color: black,
            size: 35,
          ),
          label: const SizedBox.shrink(),
        ),
      ],
    );
  }
}
