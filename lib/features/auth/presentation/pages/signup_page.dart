import 'package:blog/core/theme/pallet.dart';
import 'package:blog/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign up.",
              style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const AuthField(
              hintText: "Name",
            ),
            const SizedBox(height: 15),
            const AuthField(
              hintText: "Email",
            ),
            const SizedBox(height: 15),
            const AuthField(
              hintText: "Password",
            ),
            const SizedBox(height: 20),
            const AuthGradientButton(),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                  text: "Don't have an account?",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: " Sign In",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppPallet.gradient3,
                          fontWeight: FontWeight
                              .bold), //if it's notnull call the copy with method
                    ),
                  ]), //getting two themes to a text which is also a linl=k
            ),
          ],
        ),
      ),
    );
  }
}
