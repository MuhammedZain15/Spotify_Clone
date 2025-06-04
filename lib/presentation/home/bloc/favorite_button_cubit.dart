import 'package:e_commerce/domain/usecases/songs/add_or_remove_favorite_song.dart';
import 'package:e_commerce/presentation/home/bloc/favorite_button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  void updateFavoriteStatus(String songId) async {
    print("Toggling favorite for $songId");
    var result = await sl<AddOrRemoveFavoriteSongUseCase>().call(
      params: songId,
    );
    result.fold((l) => print("Error: $l"), (isFavorite) {
      print("Updated to: $isFavorite");
      emit(FavoriteButtonUpdated(isFavorite: isFavorite));
    });
  }
}
