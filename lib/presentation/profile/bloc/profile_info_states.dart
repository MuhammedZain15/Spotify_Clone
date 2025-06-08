import 'package:e_commerce/domain/entities/auth/user_entity.dart';

abstract class ProfileInfoStates {}

class ProfileInfoInitialState extends ProfileInfoStates {}

class ProfileInfoLoadingState extends ProfileInfoStates {}

class ProfileInfoLoadedState extends ProfileInfoStates {
  final UserEntity userEntity;

  ProfileInfoLoadedState({required this.userEntity});
}

class ProfileInfoErrorState extends ProfileInfoStates {
  final String error;

  ProfileInfoErrorState({required this.error});
}
