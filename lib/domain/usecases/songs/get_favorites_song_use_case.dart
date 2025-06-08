import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecases/usecase.dart';
import 'package:e_commerce/domain/repo/Songs/songs_repo.dart';

import '../../../common/helper/service_locator.dart';

class GetFavoritesSongUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepo>().getFavoriteSongs();
  }
}
