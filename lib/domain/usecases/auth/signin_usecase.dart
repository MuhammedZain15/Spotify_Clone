import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecases/usecase.dart';
import 'package:e_commerce/domain/repo/auth/auth_repo.dart';

import '../../../common/helper/service_locator.dart';
import '../../../data/models/auth/create_user_request_model.dart';

class SigninUsecase implements UseCase<Either, CreateUserRequestModel> {
  @override
  Future<Either> call({CreateUserRequestModel? params}) async{
    return sl<AuthRepo>().signin(params!);
  }
}
