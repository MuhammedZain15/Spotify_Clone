import 'package:e_commerce/presentation/auth/pages/signup_or_signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/buttons/basic_app_button.dart';
import '../../../core/config/assets/app_vectors.dart';
import '../../onboarding/widgets/choose_mode_widgets.dart';

class ChooseThemeColumn extends StatelessWidget {
  const ChooseThemeColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 31.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(AppVectors.appLogo),
          ),
          const Spacer(),
          Text(
            "Choose Mode",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xffDADADA),
            ),
          ),
          SizedBox(height: 32.h),
          const ChooseModeWidgets(),
          SizedBox(height: 70.h),
          BasicAppButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupOrSigninPage(),
                ),
              );
            },
            title: "Continue",
          ),
        ],
      ),
    );
  }
}
