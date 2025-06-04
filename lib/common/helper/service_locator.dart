import 'package:e_commerce/data/data_source/auth/auth_services.dart';
import 'package:e_commerce/data/repo_impl/songs/songs_repo_impl.dart';
import 'package:e_commerce/domain/repo/Songs/songs_repo.dart';
import 'package:e_commerce/domain/repo/auth/auth_repo.dart';
import 'package:e_commerce/domain/usecases/auth/signup_usecase.dart';
import 'package:e_commerce/domain/usecases/songs/add_or_remove_favorite_song.dart';
import 'package:get_it/get_it.dart';

import '../../data/data_source/songs/songs_services.dart';
import '../../data/repo_impl/auth/auth_repo_impl.dart';
import '../../domain/usecases/auth/signin_usecase.dart';
import '../../domain/usecases/songs/get_songs_usecase.dart';
import '../../domain/usecases/songs/is_favorite_song_use_case.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl.registerSingleton<AuthServices>(AuthServicesImpl());
  sl.registerSingleton<AuthRepo>(AuthRepoImpl());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(AddOrRemoveFavoriteSongUseCase());
  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());

  sl.registerSingleton<SongsServices>(SongsServicesImpl());
  sl.registerSingleton<SongsRepo>(SongsRepoImpl());
  sl.registerSingleton<GetSongsUsecase>(GetSongsUsecase());
}
