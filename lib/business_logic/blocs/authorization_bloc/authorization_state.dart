part of 'package:traveler/business_logic/blocs/authorization_bloc/authorization_bloc.dart';

class AuthorizationState {
  bool isRegistration;
  String error;

  AuthorizationState({
    this.isRegistration = false,
    this.error = '',
  });

  AuthorizationState copyWith({
    bool? isRegistration,
    String? error,
  }) {
    return AuthorizationState(
      isRegistration: isRegistration ?? this.isRegistration,
      error: error ?? this.error,
    );
  }
}
