class SongEntity {
  final String songId;
  final String title;
  final String artist;
  final num duration;
  final DateTime releaseDate;
  final bool isFavorite;

  SongEntity({
    required this.songId,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.isFavorite,
  });
}
