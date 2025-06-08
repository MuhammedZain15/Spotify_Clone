import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/helper/service_locator.dart';
import '../../../domain/entities/auth/song/song_entity.dart';
import '../../../domain/usecases/songs/is_favorite_song_use_case.dart';
import '../../models/songs/songs_model.dart';

abstract class SongsServices {
  Future<Either> getSongs();

  Future<Either> addOrRemoveFavoriteSong(String songId);

  Future<bool> isFavorite(String songId);

  Future<Either> getFavoriteSongs();
}

class SongsServicesImpl implements SongsServices {
  @override
  Future<Either<String, List<SongEntity>>> getSongs() async {
    try {
      final response = await Supabase.instance.client
          .from('Songs')
          .select('title, artist, duration, releaseDate, id_uuid');

      final List<SongsModel> songsModelList = (response as List)
          .map((songMap) => SongsModel.fromJson(songMap))
          .toList();
      print(songsModelList[0].id);
      final List<SongEntity> songs = [];

      for (final model in songsModelList) {
        final isFavorite = await sl<IsFavoriteSongUseCase>().call(
          params: model.id,
        );
        model.isFavorite = isFavorite;

        final songEntity = model.toEntity();

        songs.add(songEntity);
      }

      return Right(songs);
    } catch (e) {
      return Left('Failed to fetch songs: $e');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    try {
      final supabase = Supabase.instance.client;
      final user = supabase.auth.currentUser;
      late bool isFavorite;

      String uid = user!.id;
      final response = await supabase
          .from('FavoriteSongs')
          .select()
          .eq('user_id', uid)
          .eq('song_id', songId);

      final songs = response as List;

      if (songs.isNotEmpty) {
        final songIdToDelete = songs.first['id'];
        await supabase.from('FavoriteSongs').delete().eq('id', songIdToDelete);
        isFavorite = false;
      } else {
        await supabase.from('FavoriteSongs').insert({
          'user_id': uid,
          'song_id': songId,
        });
        isFavorite = true;
      }
      return Right(isFavorite);
    } on Exception catch (e) {
      return Left('Failed to add or remove favorite song: $e');
    }
  }

  @override
  Future<bool> isFavorite(String songId) async {
    try {
      final supabase = Supabase.instance.client;
      final user = supabase.auth.currentUser;

      String uid = user!.id;
      final response = await supabase
          .from('FavoriteSongs')
          .select()
          .eq('user_id', uid)
          .eq('song_id', songId);

      final songs = response as List;

      if (songs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavoriteSongs() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    String userId = user!.id;
    try {
      final data = await supabase
          .from('FavoriteSongs')
          .select(
            'song_id, Songs(id_uuid, title, artist, duration, releaseDate)',
          )
          .eq('user_id', userId);

      if (data.isEmpty) {
        return const Right([]);
      }

      List<SongEntity> favoriteSongs = data
          .map((item) {
            final songJson = item['Songs'];
            if (songJson == null) return null;
            final model = SongsModel.fromJson(songJson);
            return model.toEntity();
          })
          .whereType<SongEntity>()
          .toList();

      return Right(favoriteSongs);
    } catch (e) {
      return Left('Failed to fetch favorite songs: $e');
    }
  }
}
