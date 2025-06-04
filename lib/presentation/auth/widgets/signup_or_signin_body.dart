import 'package:e_commerce/core/config/assets/app_images.dart';
import 'package:e_commerce/core/config/assets/app_vectors.dart';
import 'package:e_commerce/presentation/auth/widgets/signup_signin_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/app_bar/basic_app_bar.dart';

class SignupOrSigninBody extends StatelessWidget {
  const SignupOrSigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BasicAppBar(
          hideBackButton: true,
        ),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(AppVectors.topBackGround),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(AppVectors.bottomBackGround),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(AppImages.register),
        ),

        const SignupSigninColumn(),
      ],
    );
  }
}
