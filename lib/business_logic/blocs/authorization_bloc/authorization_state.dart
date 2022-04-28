part of 'package:traveler/business_logic/blocs/authorization_bloc/authorization_bloc.dart';

class AuthorizationState {
  bool isRegistration;
  bool isLoading;
  String error;

  AuthorizationState({
    this.isRegistration = false,
    this.isLoading = false,
    this.error = '',
  });

  AuthorizationState copyWith({
    bool? isRegistration,
    bool? isLoading,
    String? error,
  }) {
    return AuthorizationState(
      isRegistration: isRegistration ?? this.isRegistration,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
