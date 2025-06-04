import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/theme/app_colors.dart';
import '../cubit/song_player_cubit.dart';
import '../cubit/song_player_states.dart';

class SongPlayerWidget extends StatelessWidget {
  const SongPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          );
        } else if (state is SongPlayerError) {
          return Center(
            child: Text(
              state.message.toString(),
              style: TextStyle(
                color: context.isDarkMode ? Colors.white : Colors.black,
                fontSize: 16.sp,
              ),
            ),
          );
        } else {
          final songPlayerCubit = context.read<SongPlayerCubit>();
          return Column(
            children: [
              Slider(
                activeColor: context.isDarkMode
                    ? const Color(0xffb7b7b7)
                    : const Color(0xff434343),
                inactiveColor: context.isDarkMode
                    ? const Color(0x0ff88888)
                    : Colors.black,

                value: songPlayerCubit.currentPosition.inSeconds.toDouble(),
                min: 0.0,
                max: songPlayerCubit.songDuration.inSeconds.toDouble(),
                onChanged: (value) {
                  final newPosition = Duration(seconds: value.toInt());
                  songPlayerCubit.audioPlayer.seek(newPosition);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    songPlayerCubit.currentPosition.toString().split('.').first,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    songPlayerCubit.songDuration.toString().split('.').first,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.repeat),
                    onPressed: () {
                      // Implement repeat functionality
                    },
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_previous_sharp),
                    onPressed: () {
                      // Implement skip previous functionality
                    },
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                  Container(
                    height: 72.h,
                    width: 72.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: IconButton(
                      icon: Icon(
                        songPlayerCubit.audioPlayer.playing
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: () {
                        songPlayerCubit.playOrPauseSong();
                      },
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next_sharp),
                    onPressed: () {
                      // Implement skip next functionality
                    },
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                  IconButton(
                    icon: const Icon(Icons.shuffle),
                    onPressed: () {},
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
