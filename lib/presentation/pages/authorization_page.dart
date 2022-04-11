import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: error.isNotEmpty,
                                child: MaterialBanner(
                                  backgroundColor: Theme.of(context).errorColor,
                                  content: Text(error),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          error = '';
                                        });
                                      },
                                      child: const Text(
                                        'dismiss',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                  contentTextStyle:
                                  const TextStyle(color: Colors.white),
                                  padding: const EdgeInsets.all(10),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Column(
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                      hintText: 'Email',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) =>
                                    value != null && value.isNotEmpty
                                        ? null
                                        : 'Required',
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    style: kTextStyleTitle,
                                    cursorColor: Colors.white,
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Password',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    validator: (value) =>
                                    value != null && value.isNotEmpty
                                        ? null
                                        : 'Required',
                                  ),
                                ],
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
        ),
      );
  }
}
