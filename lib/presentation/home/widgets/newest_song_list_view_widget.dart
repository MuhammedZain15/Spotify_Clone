import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/domain/entities/auth/song/song_entity.dart';
import 'package:e_commerce/presentation/songs_page/pages/song_player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import 'artist_image_widget.dart';

class NewestSongListViewWidget extends StatelessWidget {
  final List<SongEntity> songs;

  const NewestSongListViewWidget({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final imageUrl = Uri.encodeFull(
          "${Constants.supBaseStorageCoverUrl}${songs[index].artist} - ${songs[index].title}.jpg",
        );
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SongPlayerPage(
                song: songs[index],
              )),
            );
          },
          child: SizedBox(
            width: 147.w,
            height: 185.h,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ArtistImageWidget(imageUrl: imageUrl),
                  SizedBox(height: 10.h),
                  Text(
                    songs[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    songs[index].artist,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: context.isDarkMode
                          ? Colors.white70
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: songs.length,
    );
  }
}
