import 'package:bloc/bloc.dart';
import 'package:blog/features/auth/domain/use_cases/user_sign_up.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp; //initializing private varibales
  AuthBloc({
    required UserSignUp userSignUp, //name aurguments
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignUp(UserSignUpParams(
          email: event.email, password: event.password, name: event.name));
      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (uid) => emit(AuthSuccess(uid)),
      );
    });
  }
}
