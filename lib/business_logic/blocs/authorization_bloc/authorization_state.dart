part of 'package:traveler/business_logic/blocs/authorization_bloc/authorization_bloc.dart';

class AuthorizationState {
  bool? isRegistration;

  AuthorizationState({
    this.isRegistration,
  });

  AuthorizationState copyWith({
    bool? isRegistration,
  }) {
    return AuthorizationState(
      isRegistration: isRegistration ?? this.isRegistration,
    );
  }
}
