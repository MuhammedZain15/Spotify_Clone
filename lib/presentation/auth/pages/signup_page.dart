import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/app_bar/basic_app_bar.dart';
import '../../../core/config/assets/app_vectors.dart';
import '../widgets/signup_page_body.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.appLogo,
          width: 100.0.w,
          height: 38.0.h,
        ),
      ),
      body: const SignupPageBody(),
    );
  }
}
