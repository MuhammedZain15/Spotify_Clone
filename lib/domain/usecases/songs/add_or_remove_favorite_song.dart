import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecases/usecase.dart';

import '../../../common/helper/service_locator.dart';
import '../../repo/Songs/songs_repo.dart';

class AddOrRemoveFavoriteSongUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongsRepo>().addOrRemoveFavoriteSong(params!);
  }
}
