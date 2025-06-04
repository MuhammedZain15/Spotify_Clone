import 'package:e_commerce/presentation/home/widgets/newest_songs_widget.dart';
import 'package:e_commerce/presentation/home/widgets/play_list_widget.dart';
import 'package:e_commerce/presentation/home/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/config/assets/app_images.dart';
import '../../../core/config/assets/app_vectors.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _homeWidgetCard(context),
          TabBarWidget(tabController: tabController),
          SizedBox(
            height: 250.h,
            child: TabBarView(
              controller: tabController,
              children: [const NewestSongsWidget(), Container(), Container()],
            ),
          ),
          SizedBox(height: 20.h),
          PlayListWidget(),
        ],
      ),
    );
  }

  Widget _homeWidgetCard(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 140.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.homeCard),
            ),
            Padding(
              padding: EdgeInsets.only(right: 60.0.w),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(AppImages.homeArtist),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
