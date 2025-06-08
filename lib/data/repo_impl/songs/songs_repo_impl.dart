import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repo/Songs/songs_repo.dart';

import '../../../common/helper/service_locator.dart';
import '../../data_source/songs/songs_services.dart';

class SongsRepoImpl extends SongsRepo {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongsServices>().getSongs();
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    return await sl<SongsServices>().addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavorite(String songId) async {
    return await sl<SongsServices>().isFavorite(songId);
  }

  @override
  Future<Either> getFavoriteSongs() async {
    return await sl<SongsServices>().getFavoriteSongs();
  }
}
