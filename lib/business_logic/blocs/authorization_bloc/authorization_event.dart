part of 'package:traveler/business_logic/blocs/authorization_bloc/authorization_bloc.dart';

abstract class AuthorizationEvent {}

class LoginMethodChanged extends AuthorizationEvent {
  bool isRegistration;

  LoginMethodChanged(this.isRegistration) : super();
}

class InputErrorChanged extends AuthorizationEvent {
  String error;

  InputErrorChanged(this.error) : super();
}

class AuthorizationConfirmed extends AuthorizationEvent {
  bool isRegistration;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  BuildContext context;

  AuthorizationConfirmed({
    required this.isRegistration,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfirmationController,
    required this.context,
  }) : super();
}
