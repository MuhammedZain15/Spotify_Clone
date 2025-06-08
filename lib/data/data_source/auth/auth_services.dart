import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/auth/create_user_request_model.dart';
import 'package:e_commerce/domain/entities/auth/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/constants.dart';
import '../../models/auth/user_model.dart';

abstract class AuthServices {
  Future<Either<String, String>> signup(
    CreateUserRequestModel createUserRequestModel,
  );

  Future<Either<String, String>> signin(
    CreateUserRequestModel createUserRequestModel,
  );

  Future<Either> getUser();
}

class AuthServicesImpl implements AuthServices {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<Either<String, String>> signin(
    CreateUserRequestModel createUserRequestModel,
  ) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: createUserRequestModel.email,
        password: createUserRequestModel.password,
      );
      if (response.user == null) {
        return const Left("Signin failed: user not found");
      }
      return const Right("Signin Success");
    } on AuthException catch (error) {
      return Left("Signin failed: ${error.message}");
    } catch (error) {
      return Left("Signin error: $error");
    }
  }

  @override
  Future<Either<String, String>> signup(
    CreateUserRequestModel createUserRequestModel,
  ) async {
    try {
      final response = await supabase.auth.signUp(
        email: createUserRequestModel.email,
        password: createUserRequestModel.password,
      );

      final user = response.user;

      if (user == null) {
        return const Left("Signup failed: no user returned");
      }

      await supabase.from('Users').upsert({
        'id': user.id,
        'name': createUserRequestModel.fullName.toString(),
        'email': user.email.toString(),
      });

      return const Right("Signup Success");
    } on AuthException catch (error) {
      return Left("Signup failed: ${error.message}");
    } catch (error) {
      return Left("Signup error: $error");
    }
  }

  @override
  Future<Either<String, UserEntity>> getUser() async {
    final supabase = Supabase.instance.client;

    final user = supabase.auth.currentUser;
    if (user == null) {
      return const Left("User not logged in");
    }

    try {
      final response = await supabase
          .from('Users')
          .select()
          .eq('id', user.id)
          .single();

      UserModel userModel = UserModel.fromJson(response);
      userModel.imageUrl =
          user.userMetadata?['image_url'] ?? Constants.defaultImage;

      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return Left("Failed to get user: $e");
    }
  }
}
