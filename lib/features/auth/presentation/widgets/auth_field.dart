import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText; //constructors
  final TextEditingController controller;
  final bool isObscureText;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        //based on this can validate the entire feild
        if (value!.isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      obscureText: isObscureText,
    ); //use textformfeild instead of text feild bcz entire signup page is a form, we needto validate the entire signup process
  }
}
