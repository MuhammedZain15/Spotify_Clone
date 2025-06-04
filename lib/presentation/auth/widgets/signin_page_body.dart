import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/presentation/auth/pages/signup_page.dart';
import 'package:e_commerce/presentation/auth/widgets/signin_form_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_action_widget.dart';

class SigninPageBody extends StatelessWidget {
  const SigninPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 50.0.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "Register",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: context.isDarkMode
                    ? const Color(0xffF2F2F2)
                    : const Color(0xff383838),
              ),
            ),
            SizedBox(height: 16.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "If you need any support ",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: context.isDarkMode
                      ? const Color(0xffE1E1E1)
                      : const Color(0xff393939),
                ),
                children: [
                  TextSpan(
                    text: "Click here",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff38B432),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle the tap event, e.g., navigate to support page
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
             SigninFormWidget(),
            SizedBox(height: 30.h),
            const BottomActionWidget(),
            SizedBox(height: 40.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Not a member? ",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: context.isDarkMode
                      ? const Color(0xffE1E1E1)
                      : const Color(0xff393939),
                ),
                children: [
                  TextSpan(
                    text: "Register now",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff288CE9),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
