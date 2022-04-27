import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:traveler/business_logic/blocs/authorization_bloc/authorization_bloc.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveler/presentation/widgets/authorization_text_field.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthorizationBloc(),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<AuthorizationBloc, AuthorizationState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(0.5, 1),
                        end: const Alignment(0.5, -1),
                        colors: <Color>[
                          kMainColor,
                          kBackgroundWidgetColor.withOpacity(0.9),
                        ],
                      ),
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SafeArea(
                              child: Form(
                                key: formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 400),
                                  child: Column(
                                    children: [
                                      Text(
                                        state.isRegistration
                                            ? 'Registration'
                                            : 'Login',
                                        style: kTextStyleTitle.copyWith(
                                            fontSize: 24),
                                      ),
                                      const SizedBox(height: 50),
                                      AuthorizationTextField(
                                        hintText: 'Email',
                                        controller: emailController,
                                        obscureText: false,
                                      ),
                                      const SizedBox(height: 20),
                                      AuthorizationTextField(
                                        hintText: 'Password',
                                        controller: passwordController,
                                        obscureText: true,
                                      ),
                                      if (state.isRegistration)
                                        const SizedBox(height: 20),
                                      if (state.isRegistration)
                                        AuthorizationTextField(
                                          hintText: 'Repeat your password',
                                          controller:
                                              passwordConfirmationController,
                                          obscureText: true,
                                        ),
                                      const SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          if (emailController.text.isEmpty &&
                                              passwordController.text.isEmpty) {
                                            context
                                                .read<AuthorizationBloc>()
                                                .add(InputErrorChanged(
                                                    'Text fields are empty!'));
                                          }
                                          context.read<AuthorizationBloc>().add(
                                                AuthorizationConfirmed(
                                                  context: context,
                                                  isRegistration:
                                                      state.isRegistration,
                                                  emailController:
                                                      emailController,
                                                  passwordController:
                                                      passwordController,
                                                  passwordConfirmationController:
                                                      passwordConfirmationController,
                                                ),
                                              );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color:
                                                kWidgetColor.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Center(
                                            child: Text(
                                              state.isRegistration
                                                  ? 'Sign up'
                                                  : 'Sign in',
                                              style: kTextStyleTitle.copyWith(
                                                  color:
                                                      kBackgroundWidgetColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              style: kTextStyleFootnote,
                                              text: state.isRegistration
                                                  ? 'Do you have an account? '
                                                  : 'Don\'t have an account? ',
                                            ),
                                            TextSpan(
                                              style:
                                                  kTextStyleFootnote.copyWith(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w900),
                                              text: state.isRegistration
                                                  ? 'Sign in'
                                                  : 'Sign up',
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  context
                                                      .read<AuthorizationBloc>()
                                                      .add(LoginMethodChanged(
                                                          !state
                                                              .isRegistration));
                                                },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Visibility(
                      visible: state.error.isNotEmpty,
                      child: MaterialBanner(
                        backgroundColor: Theme.of(context).errorColor,
                        content: Text(state.error),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context
                                  .read<AuthorizationBloc>()
                                  .add(InputErrorChanged(''));
                            },
                            child: const Text(
                              'dismiss',
                              style: TextStyle(color: kWidgetColor),
                            ),
                          )
                        ],
                        contentTextStyle: const TextStyle(color: kWidgetColor),
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
