import 'package:blog/core/theme/pallet.dart';
import 'package:blog/features/auth/presentation/pages/signup_page.dart';
import 'package:blog/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Form(
          //inorder to validate
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign in.",
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              AuthField(
                hintText: "Email",
                controller: emailController,
              ),
              const SizedBox(height: 15),
              AuthField(
                controller: passwordController,
                hintText: "Password",
                isObscureText: true,
              ),
              const SizedBox(height: 20),
              const AuthGradientButton(
                buttonText: 'Sign in',
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      //material routes are used to navigate between pages
                      context,
                      SignUpPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppPallet.gradient3,
                              fontWeight: FontWeight
                                  .bold), //if it's notnull call the copy with method
                        ),
                      ]), //getting two themes to a text which is also a linl=k
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
