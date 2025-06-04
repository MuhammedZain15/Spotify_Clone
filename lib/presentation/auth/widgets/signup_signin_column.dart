import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/common/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce/presentation/auth/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/assets/app_vectors.dart';
import '../pages/signup_page.dart';

class SignupSigninColumn extends StatelessWidget {
  const SignupSigninColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 200.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppVectors.appLogo),
            SizedBox(height: 55.h),
            Text(
              "Enjoy listening to music",
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: context.isDarkMode
                    ? Colors.white
                    : const Color(0xff383838),
              ),
            ),
            SizedBox(height: 21.h),
            Text(
              textAlign: TextAlign.center,
              "Spotify is a proprietary Swedish audio streaming and media services provider ",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xffA0A0A0),
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    title: "Register",
                    height: 80.h,
                    fontSize: 19.sp,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: context.isDarkMode
                            ? Colors.white
                            : const Color(0xff313131),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
