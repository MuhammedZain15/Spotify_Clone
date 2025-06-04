import 'dart:ui';

import 'package:e_commerce/core/config/assets/app_vectors.dart';
import 'package:e_commerce/presentation/choose_theme/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseModeWidgets extends StatelessWidget {
  const ChooseModeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                context.read<ThemeCubit>().toggleTheme(ThemeMode.dark);
              },
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 73.w,
                    height: 73.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff30393C).withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(AppVectors.moon, fit: BoxFit.none),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Dark Mode",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xffDADADA),
              ),
            ),
          ],
        ),
        SizedBox(width: 71.w),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                context.read<ThemeCubit>().toggleTheme(ThemeMode.light);
              },
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: 73.h,
                    width: 73.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff30393C).withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(AppVectors.sun, fit: BoxFit.none),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Light Mode",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xffDADADA),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
