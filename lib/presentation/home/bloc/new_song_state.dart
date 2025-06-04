import '../../../domain/entities/auth/song/song_entity.dart';

abstract class NewSongState {}
class NewSongInitialState extends NewSongState {}
class NewSongLoadingState extends NewSongState {}

class NewSongSuccessState extends NewSongState {
  final List<SongEntity> songs;

  NewSongSuccessState({required this.songs});
}

class NewSongErrorState extends NewSongState {
  final String message;

  NewSongErrorState(this.message);
}
