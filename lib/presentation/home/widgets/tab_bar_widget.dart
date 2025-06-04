import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarWidget extends StatelessWidget {
  final TabController tabController;
  const TabBarWidget({super.key, required this.tabController});

  @override

    Widget build(BuildContext context) {
      return TabBar(
        /* isScrollable: true,*/
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.h),
        labelColor: context.isDarkMode ? const Color(0xffDBDBDB) : Colors.black,
        unselectedLabelColor: context.isDarkMode
            ? const Color(0xff616161)
            : const Color(0xffbebebe),
        dividerColor: Colors.transparent,
        indicatorColor: AppColors.primaryColor,
        controller: tabController,
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        tabs: const [Text("News"), Text("Videos"), Text("Artist")],
      );
    }
  }



