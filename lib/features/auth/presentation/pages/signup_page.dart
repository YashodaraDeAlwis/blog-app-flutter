import 'package:blog/core/theme/pallet.dart';
import 'package:blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/features/auth/presentation/pages/login_page.dart';
import 'package:blog/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        //reusable
        builder: (context) => const SignUpPage(),
      );
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Form(
          //inorder to validate
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign up.",
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              AuthField(
                hintText: "Name",
                controller: nameController,
              ),
              const SizedBox(height: 15),
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
              AuthGradientButton(
                buttonText: 'Sign up',
                onPressed: () => {
                  if (formKey.currentState!.validate())
                    {
                      context.read<AuthBloc>().add(
                            AuthSignUp(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                name: nameController.text.trim()),
                          )
                    }
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      //material routes are used to navigate between pages
                      context,
                      LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: "Already have an account?",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
