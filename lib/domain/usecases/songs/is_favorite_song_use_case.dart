import 'package:e_commerce/core/usecases/usecase.dart';

import '../../../common/helper/service_locator.dart';
import '../../repo/Songs/songs_repo.dart';

class IsFavoriteSongUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongsRepo>().isFavorite(params!);
  }
}
