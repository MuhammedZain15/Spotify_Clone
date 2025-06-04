import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/auth/create_user_request_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthServices {
  Future<Either<String, String>> signup(
    CreateUserRequestModel createUserRequestModel,
  );

  Future<Either<String, String>> signin(
    CreateUserRequestModel createUserRequestModel,
  );
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
}

