import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:e_commerce/presentation/home/bloc/favorite_button_cubit.dart';
import 'package:e_commerce/presentation/home/bloc/favorite_button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/auth/song/song_entity.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final SongEntity songs;

  const FavoriteButtonWidget({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
              onPressed: () {
                context.read<FavoriteButtonCubit>().updateFavoriteStatus(
                  songs.songId,
                );
              },
              icon: songs.isFavorite
                  ? Icon(
                      Icons.favorite_rounded,
                      color: context.isDarkMode
                          ? const Color(0xff565656)
                          : const Color(0xffb4b4b4),
                    )
                  : Icon(
                      Icons.favorite_border_rounded,
                      color: context.isDarkMode
                          ? const Color(0xff565656)
                          : const Color(0xffb4b4b4),
                    ),
            );
          }
          if (state is FavoriteButtonUpdated) {
            return IconButton(
              onPressed: () {
                context.read<FavoriteButtonCubit>().updateFavoriteStatus(
                  songs.songId,
                );
              },
              icon: state.isFavorite
                  ? Icon(
                      Icons.favorite_rounded,
                      color: context.isDarkMode
                          ? const Color(0xff565656)
                          : const Color(0xffb4b4b4),
                    )
                  : Icon(
                      Icons.favorite_border_rounded,
                      color: context.isDarkMode
                          ? const Color(0xff565656)
                          : const Color(0xffb4b4b4),
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
    );
  }
}
