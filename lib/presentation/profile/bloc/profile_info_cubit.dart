import 'package:e_commerce/domain/usecases/auth/get_user_usecase.dart';
import 'package:e_commerce/presentation/profile/bloc/profile_info_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoStates> {
  ProfileInfoCubit() : super(ProfileInfoInitialState());

  Future<void> getProfileInfo() async {
    var user = await sl<GetUserUsecase>().call();
    user.fold(
      (l) {
        emit(ProfileInfoErrorState(error: l));
      },
      (userEntity) {
        emit(ProfileInfoLoadedState(userEntity: userEntity));
      },
    );
  }
}
