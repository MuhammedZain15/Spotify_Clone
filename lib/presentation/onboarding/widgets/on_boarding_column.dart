import 'package:e_commerce/common/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce/presentation/choose_theme/pages/choose_theme_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/config/assets/app_vectors.dart';

class OnBoardingColumn extends StatelessWidget {
  const OnBoardingColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(AppVectors.appLogo),
          ),
          const Spacer(),
          Text(
            "Enjoy listening to music",
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xffDADADA),
            ),
          ),
          SizedBox(height: 21.h),
          Text(
            textAlign: TextAlign.center,
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff797979),
            ),
          ),
          SizedBox(height: 40.h),
          BasicAppButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ChooseThemePage()),
              );
            },
            title: "Get Started",
          ),
        ],
      ),
    );
  }
}
