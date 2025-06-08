import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecases/usecase.dart';
import 'package:e_commerce/domain/repo/auth/auth_repo.dart';

import '../../../common/helper/service_locator.dart';

class GetUserUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepo>().getUser();
  }
}
