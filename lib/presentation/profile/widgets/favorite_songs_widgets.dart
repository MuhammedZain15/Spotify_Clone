import 'package:e_commerce/common/helper/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/favorite_song_cubit.dart';
import '../bloc/favorite_song_states.dart';
import 'favorite_item.dart';

class FavoriteSongsWidget extends StatelessWidget {
  const FavoriteSongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteSongCubit()..getFavoriteSongs(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favorite Songs",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: context.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 15.h),
            BlocBuilder<FavoriteSongCubit, FavoriteSongStates>(
              builder: (context, state) {
                if (state is FavoriteSongLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FavoriteSongErrorState) {
                  return Center(
                    child: Text(
                      state.error,
                      style: TextStyle(
                        color: context.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                } else if (state is FavoriteSongSuccessState) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return FavoriteItem(
                        favoriteSongs: state.favoriteSongs[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 25.h);
                    },
                    itemCount: state.favoriteSongs.length,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
