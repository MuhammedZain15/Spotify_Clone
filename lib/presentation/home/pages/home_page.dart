import 'package:e_commerce/common/widgets/app_bar/basic_app_bar.dart';
import 'package:e_commerce/core/config/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBackButton: true,
        actions: const [Icon(Icons.more_vert)],
        title: SvgPicture.asset(
          AppVectors.appLogo,
          width: 100.0.w,
          height: 38.0.h,
        ),
      ),
      body: const HomePageBody(),
    );
  }
}
