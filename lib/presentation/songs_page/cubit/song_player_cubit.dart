import 'package:e_commerce/presentation/songs_page/cubit/song_player_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration currentPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerInitial()) {
    audioPlayer.positionStream.listen((position) {
      currentPosition = position;
      updateSongPlayer();
    });

    audioPlayer.durationStream.listen((duration) {
      songDuration = duration ?? Duration.zero;
    });
  }

  void updateSongPlayer() {
    emit(SongPlayerInitial());
  }

  Future<void> loadSong(String songUrl) async {
    emit(SongPlayerLoading());
    try {
      await audioPlayer.setUrl(songUrl).then((_) {
        emit(SongPlayerSuccess());
      });
    } on PlayerException catch (e) {
      emit(SongPlayerError(message: e.message));
    } on PlayerInterruptedException catch (e) {
      emit(SongPlayerError(message: e.message));
    } catch (e) {
      emit(SongPlayerError(message: e.toString()));
    }
  }

  Future<void> playOrPauseSong() async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play();
    }
    emit(SongPlayerSuccess());
  }

  @override
  Future<void> close() async {
    await audioPlayer.dispose();
    return super.close();
  }
}
