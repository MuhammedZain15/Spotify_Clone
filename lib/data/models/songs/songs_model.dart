import '../../../domain/entities/auth/song/song_entity.dart';

class SongsModel {
  final String id;
  final String title;
  final String artist;
  final num duration;
  final DateTime releaseDate;
  bool? isFavorite;

  SongsModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    this.isFavorite,
  });

  factory SongsModel.fromJson(Map<String, dynamic> json) {
    return SongsModel(
      id: json['id_uuid'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      duration: json['duration'] as num,
      releaseDate: DateTime.parse(json['releaseDate']),
    );
  }

  SongEntity toEntity() {
    return SongEntity(
      title: title,
      artist: artist,
      duration: duration,
      releaseDate: releaseDate,
      isFavorite: isFavorite ?? false,
      songId: id,
    );
  }
}
