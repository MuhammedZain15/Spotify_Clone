import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/core/config/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomActionWidget extends StatelessWidget {
  const BottomActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: context.isDarkMode ? Colors.white : Colors.black,
                height: 50.h,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              "OR",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: context.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Divider(
                color: context.isDarkMode ? Colors.white : Colors.black,
                height: 50.h,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(AppVectors.googleLogo),
            SvgPicture.asset(AppVectors.appleLogo),
          ],
        ),
      ],
    );
  }
}
