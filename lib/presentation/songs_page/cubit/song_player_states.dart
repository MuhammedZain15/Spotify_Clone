abstract class SongPlayerState {}

class SongPlayerInitial extends SongPlayerState {}

class SongPlayerLoading extends SongPlayerState {}

class SongPlayerSuccess extends SongPlayerState {}

class SongPlayerError extends SongPlayerState {
  final String? message;

  SongPlayerError({this.message});
}
