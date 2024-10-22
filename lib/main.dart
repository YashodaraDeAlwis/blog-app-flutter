import 'package:blog/core/secrets/app_secret.dart';
import 'package:blog/core/theme/theme.dart';
import 'package:blog/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog/features/auth/domain/use_cases/user_sign_up.dart';
import 'package:blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // just do this as a precausion
  final supabase = await Supabase.initialize(
    url: AppSecrets.superbaseUrl,
    anonKey: AppSecrets.superbaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImpl(
              AuthRemoteDataSourceImpl(
                supabase.client,
              ),
            ),
          ),
        ),
      )
    ],
    child: const MyApp(),
  ));
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
