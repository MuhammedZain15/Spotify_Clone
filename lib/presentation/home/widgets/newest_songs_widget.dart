import 'package:e_commerce/presentation/home/widgets/newest_song_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/new_song_cubit.dart';
import '../bloc/new_song_state.dart';

class NewestSongsWidget extends StatelessWidget {
  const NewestSongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewSongCubit()..getNewSongs(),
      child: SizedBox(
        height: 200.h,
        child: BlocBuilder<NewSongCubit, NewSongState>(
          builder: (context, state) {
            if (state is NewSongLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewSongSuccessState) {
              print(state.songs);
              return NewestSongListViewWidget(songs: state.songs);
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
}
