import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/auth/create_user_request_model.dart';

abstract class AuthRepo {
  Future<Either> signup(CreateUserRequestModel createUserRequestModel);

  Future<Either> signin(CreateUserRequestModel createUserRequestModel);
}
