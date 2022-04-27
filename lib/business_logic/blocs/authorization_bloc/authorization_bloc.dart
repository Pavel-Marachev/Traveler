import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../main.dart';

part 'package:traveler/business_logic/blocs/authorization_bloc/authorization_event.dart';
part 'package:traveler/business_logic/blocs/authorization_bloc/authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizationState()) {
    on<AuthorizationConfirmed>(authorization);
    on<LoginMethodChanged>((event, emit) =>
        emit(state.copyWith(isRegistration: event.isRegistration)));
    on<InputErrorChanged>(
        (event, emit) => emit(state.copyWith(error: event.error)));
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> authorization(
      AuthorizationConfirmed event, Emitter<AuthorizationState> emit) async {
    try {
      if (event.isRegistration) {
        if (event.passwordController.text ==
            event.passwordConfirmationController.text) {
          await _auth.createUserWithEmailAndPassword(
              email: event.emailController.text,
              password: event.passwordController.text);
          Navigator.of(event.context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyApp()));
        } else {
          state.error = 'Passwords do not match';
        }
      } else {
        await _auth.signInWithEmailAndPassword(
            email: event.emailController.text,
            password: event.passwordController.text);
        Navigator.of(event.context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyApp()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(state.copyWith(error: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        emit(state.copyWith(error: 'Wrong password provided'));
      } else if (e.code == 'invalid-email') {
        emit(state.copyWith(error: 'Invalid email entered'));
      } else if (e.code == 'weak-password') {
        emit(state.copyWith(error: 'Password should be at least 6 characters'));
      }
    }
  }
}
