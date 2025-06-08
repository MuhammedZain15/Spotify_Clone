import '../../../domain/entities/auth/song/song_entity.dart';

abstract class FavoriteSongStates {}

class FavoriteSongInitialState extends FavoriteSongStates {}

class FavoriteSongLoadingState extends FavoriteSongStates {}

class FavoriteSongSuccessState extends FavoriteSongStates {
  final List<SongEntity> favoriteSongs;

  FavoriteSongSuccessState({required this.favoriteSongs});
}

class FavoriteSongErrorState extends FavoriteSongStates {
  final String error;

  FavoriteSongErrorState(this.error);
}
