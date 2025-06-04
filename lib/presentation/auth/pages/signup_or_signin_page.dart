import 'package:flutter/material.dart';

import '../widgets/signup_or_signin_body.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupOrSigninBody(),
    );
  }
}
