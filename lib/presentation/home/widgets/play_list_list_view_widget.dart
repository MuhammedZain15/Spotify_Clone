import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/domain/entities/auth/song/song_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/buttons/favorite_button_widget.dart';
import '../../songs_page/pages/song_player_page.dart';

class PlayListListViewWidget extends StatelessWidget {
  final List<SongEntity> songs;

  const PlayListListViewWidget({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) {
        return SizedBox(height: 25.h);
      },
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SongPlayerPage(song: songs[index]),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode
                          ? const Color(0xff2c2c2c)
                          : const Color(0xffE6E6E6),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode
                            ? const Color(0xff959595)
                            : const Color(0xff555555),
                      ),
                    ),
                  ),
                  SizedBox(width: 23.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].artist,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: context.isDarkMode
                              ? const Color(0xffd6d6d6)
                              : Colors.black,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        songs[index].title,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: context.isDarkMode
                              ? const Color(0xffd6d6d6)
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    songs[index].duration.toString().replaceAll(".", ":"),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: context.isDarkMode
                          ? const Color(0xffd6d6d6)
                          : Colors.black,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  FavoriteButtonWidget(songs: songs[index]),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
