import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/common/widgets/app_bar/basic_app_bar.dart';
import 'package:e_commerce/presentation/songs_page/widgets/song_player_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import '../../../domain/entities/auth/song/song_entity.dart';
import '../cubit/song_player_cubit.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity song;

  const SongPlayerPage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    final imageUrl = Uri.encodeFull(
      "${Constants.supBaseStorageCoverUrl}${song.artist} - ${song.title}.jpg",
    );
    final songUrl = Uri.encodeFull(
      "${Constants.supBaseStorageSongsUrl}${song.artist} - ${song.title}.mp3",
    );

    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          "Now Playing",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: context.isDarkMode ? const Color(0xffdddddd) : Colors.black,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: BlocProvider(
        create: (context) => SongPlayerCubit()..loadSong(songUrl),
        child: SongPlayerBody(songs: song),
      ),
    );
  }
}
