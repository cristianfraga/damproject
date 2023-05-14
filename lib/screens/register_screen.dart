import 'package:damproject/config/config.dart';
import 'package:damproject/providers/providers.dart';
import 'package:damproject/services/services.dart';
import 'package:damproject/ui/ui.dart';
import 'package:damproject/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This code represents a register screen in a Flutter application.
// The screen allows users to create a new account by providing their email and password.
// RegisterScreen is a StatelessWidget that represents the register screen of the application.
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      registerTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 30),
                    Builder(
                      builder: (BuildContext context) => ChangeNotifierProvider(
                        create: (_) => LoginFormProvider(),
                        child: const _LoginForm(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed('login_screen'),
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(indigo.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                  ),
                  child: const Text(openAccountButton,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: black54))),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

// _LoginForm is a StatelessWidget that represents the login form within the register screen.
class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                labelText: emailInput,
                hintText: emailHint,
                prefixIcon: Icons.email_outlined),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              RegExp regExp = RegExp(emailRegex);
              return regExp.hasMatch(value ?? '') ? null : emailError;
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
                labelText: passwordInput,
                hintText: passwordHint,
                prefixIcon: Icons.lock_outline),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 8)
                  ? null
                  : passwordError;
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: grey,
            elevation: 0,
            color: cyan,
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final authService =
                        Provider.of<AuthService>(context, listen: false);
                    if (!loginForm.isValidForm()) return;
                    loginForm.isLoading = true;
                    final String? errorMessage = await authService.createUser(
                        loginForm.email, loginForm.password);
                    if (errorMessage == null) {
                      Navigator.of(context).pushReplacementNamed('home_screen');
                    } else {
                      NotificationsService.showSnackbar(emailTaken);
                      loginForm.isLoading = false;
                    }
                  },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoading ? loadingButton : submitButton,
                style: const TextStyle(color: white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
