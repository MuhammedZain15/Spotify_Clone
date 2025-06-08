import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data_source/auth/auth_services.dart';

import '../../../common/helper/service_locator.dart';
import '../../../domain/repo/auth/auth_repo.dart';
import '../../models/auth/create_user_request_model.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> signin(CreateUserRequestModel createUserRequestModel) async {
    return await sl<AuthServices>().signin(createUserRequestModel);
  }

  @override
  Future<Either> signup(CreateUserRequestModel createUserRequestModel) async {
    return await sl<AuthServices>().signup(createUserRequestModel);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthServices>().getUser();
  }
}
