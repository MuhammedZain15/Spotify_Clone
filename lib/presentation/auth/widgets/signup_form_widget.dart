import 'package:e_commerce/common/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce/domain/usecases/auth/signup_usecase.dart';
import 'package:e_commerce/presentation/auth/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/helper/service_locator.dart';
import '../../../data/models/auth/create_user_request_model.dart';

class SignupFormWidget extends StatelessWidget {
  SignupFormWidget({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: fullNameController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: "Full Name",
            hintStyle: TextStyle(),
          ).applyDefaults(Theme.of(context).inputDecorationTheme),
          // Add more properties as needed
        ),
        SizedBox(height: 16.0.h),
        TextField(
          controller: emailController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: "Enter Email",
            hintStyle: TextStyle(),
          ).applyDefaults(Theme.of(context).inputDecorationTheme),
          // Add more properties as needed
        ),
        SizedBox(height: 16.0.h),
        TextField(
          controller: passwordController,
          obscureText: true,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            hintText: "Enter Password",
            hintStyle: TextStyle(),
          ).applyDefaults(Theme.of(context).inputDecorationTheme),
          // Add more properties as needed
        ),
        SizedBox(height: 33.0.h),
        BasicAppButton(
          onPressed: () async {
            var result = await sl<SignupUsecase>().call(
              params: CreateUserRequestModel(
                fullName: fullNameController.text.toString(),
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
                  MaterialPageRoute(builder: (context) => const SigninPage()),
                  (route) => false,
                ); // Navigate to home page
              },
            );
          },
          title: "Create Account",
          fontSize: 20.sp,
          height: 80.h,
        ),
      ],
    );
  }
}
