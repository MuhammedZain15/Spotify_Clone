import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import '../../../domain/entities/auth/song/song_entity.dart';

class FavoriteItem extends StatelessWidget {
  final SongEntity favoriteSongs;

  const FavoriteItem({super.key, required this.favoriteSongs});

  @override
  Widget build(BuildContext context) {
    final imageUrl = Uri.encodeFull(
      "${Constants.supBaseStorageCoverUrl}${favoriteSongs.artist} - ${favoriteSongs.title}.jpg",
    );
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 60.w,
            height: 60.h,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                favoriteSongs.title,
                style: TextStyle(
                  color: context.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                favoriteSongs.artist,
                style: TextStyle(
                  color: context.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        Text(
          favoriteSongs.duration.toString(),
          style: TextStyle(
            color: context.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
         SizedBox(width: 10.w),
        Icon(
          Icons.more_horiz,
          color: context.isDarkMode ? Colors.white : Colors.black,
        ),
      ],
    );
  }
}
