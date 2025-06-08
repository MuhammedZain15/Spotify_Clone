import 'package:e_commerce/domain/entities/auth/song/song_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/service_locator.dart';
import '../../../domain/usecases/songs/get_favorites_song_use_case.dart';
import 'favorite_song_states.dart';

class FavoriteSongCubit extends Cubit<FavoriteSongStates> {
  FavoriteSongCubit() : super(FavoriteSongInitialState());
  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {
    emit(FavoriteSongLoadingState());
    var result = await sl<GetFavoritesSongUseCase>().call();
    result.fold((error) => emit(FavoriteSongErrorState(error)), (songs) {
      favoriteSongs = songs;
      emit(FavoriteSongSuccessState(favoriteSongs: favoriteSongs));
    });
  }
}
