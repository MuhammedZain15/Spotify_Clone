import 'package:e_commerce/presentation/profile/widgets/profile_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'favorite_songs_widgets.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ProfileInfoWidget(),
        SizedBox(height: 26.h),
        const FavoriteSongsWidget(),
      ],
    );
  }
}
