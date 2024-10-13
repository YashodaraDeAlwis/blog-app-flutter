import 'package:blog/core/secrets/app_secret.dart';
import 'package:blog/core/theme/theme.dart';
import 'package:blog/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // just do this as a precausion
  final supabase = await Supabase.initialize(
      url: AppSecret.superbaseUrl, anonKey: AppSecret.superbaseAnonKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter blog',
      theme: AppTheme.darkTheme,
      home: const LoginPage(),
    );
  }
}
