import 'package:e_commerce/presentation/home/bloc/new_song_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/service_locator.dart';
import '../../../domain/usecases/songs/get_songs_usecase.dart';

class NewSongCubit extends Cubit<NewSongState> {
  NewSongCubit() : super(NewSongInitialState());

  Future<void> getNewSongs() async {
    emit(NewSongLoadingState());
    var returnedSongs = await sl<GetSongsUsecase>().call();
    returnedSongs.fold(
      (failure) => emit(
        NewSongErrorState(
          failure ?? 'An error occurred while fetching new songs',
        ),
      ),
      (songs) => emit(NewSongSuccessState(songs: songs)),
    );
  }
}
