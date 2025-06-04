import 'package:e_commerce/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/helper/service_locator.dart';
import '../../../common/widgets/buttons/basic_app_button.dart';
import '../../../data/models/auth/create_user_request_model.dart';
import '../../../domain/usecases/auth/signin_usecase.dart';

class SigninFormWidget extends StatelessWidget {
  SigninFormWidget({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: "Enter Username or Email",
            hintStyle: TextStyle(),
          ).applyDefaults(Theme.of(context).inputDecorationTheme),
          // Add more properties as needed
        ),
        SizedBox(height: 16.0.h),
        TextField(
          obscureText: true,
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            hintText: " Password",
            hintStyle: TextStyle(),
          ).applyDefaults(Theme.of(context).inputDecorationTheme),
        ),
        SizedBox(height: 33.0.h),
        BasicAppButton(
          onPressed: () async {
            var result = await sl<SigninUsecase>().call(
              params: CreateUserRequestModel(
                email: emailController.text.toString().trim(),
                password: passwordController.text.toString(),
              ),
            );
            result.fold(
              (error) {
                // Handle error
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(error.toString())));
              },
              (success) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
                ); // Navigate to home page
              },
            );
          },
          title: "Sign In",
          fontSize: 20.sp,
          height: 80.h,
        ),
      ],
    );
  }
}
