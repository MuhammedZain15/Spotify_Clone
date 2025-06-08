import 'package:dartz/dartz.dart';

abstract class SongsRepo {
  Future<Either>getNewSongs();
  Future<Either> addOrRemoveFavoriteSong(String songId);
  Future<bool> isFavorite(String songId);
  Future<Either> getFavoriteSongs();
}