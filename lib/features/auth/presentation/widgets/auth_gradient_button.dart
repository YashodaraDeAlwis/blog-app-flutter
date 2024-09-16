import 'package:blog/core/theme/pallet.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [AppPallet.gradient2, AppPallet.gradient3],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          fixedSize: const Size(395, 55),
        ),
        child: const Text(
          "Sign Up",
          style: TextStyle(
            color: AppPallet.whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
