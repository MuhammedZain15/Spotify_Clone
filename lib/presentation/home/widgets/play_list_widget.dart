import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/presentation/home/widgets/play_list_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/new_song_cubit.dart';
import '../bloc/new_song_state.dart';

class PlayListWidget extends StatelessWidget {
  const PlayListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewSongCubit()..getNewSongs(),
      child: SizedBox(
        height: 245.h,
        child: BlocBuilder<NewSongCubit, NewSongState>(
          builder: (context, state) {
            if (state is NewSongLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewSongSuccessState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Column(
                  children: [
                    _titleText(context),
                    Expanded(child: PlayListListViewWidget(songs: state.songs)),
                  ],
                ),
              );
            }
            return const Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _titleText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Playlists',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: context.isDarkMode
                ? const Color(0xffDBDBDB)
                : const Color(0xff131313),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: context.isDarkMode
                  ? const Color(0xffc6c6c6)
                  : const Color(0xff131313),
            ),
          ),
        ),
      ],
    );
  }
}
