import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText; //constructor
  const AuthField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    ); //use textformfeild instead of text feild bcz entire signup page is a form, we needto validate the entire signup process
  }
}
