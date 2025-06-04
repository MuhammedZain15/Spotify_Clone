import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/presentation/songs_page/widgets/song_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/buttons/favorite_button_widget.dart';
import '../../../core/constants.dart';
import '../../../domain/entities/auth/song/song_entity.dart';

class SongPlayerBody extends StatelessWidget {
  final SongEntity songs;

  const SongPlayerBody({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    final imageUrl = Uri.encodeFull(
      "${Constants.supBaseStorageCoverUrl}${songs.artist} - ${songs.title}.jpg",
    );
    final songUrl = Uri.encodeFull(
      "${Constants.supBaseStorageSongsUrl}${songs.artist} - ${songs.title}.mp3",
    );
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 335.w,
            height: 370.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 17.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    songs.title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    songs.artist,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: context.isDarkMode
                          ? const Color(0xffBABABA)
                          : const Color(0xff404040),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              FavoriteButtonWidget(songs: songs),
            ],
          ),
          SizedBox(height: 40.h),
          const SongPlayerWidget(),
        ],
      ),
    );
  }
}
