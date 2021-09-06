import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/user_register/user_register.dart';

abstract class ISignupRepository {
  Future<Either<String, UserRegister>> signup(
      {required String email,
      required String userName,
      required String password,
      required String firstName,
      required String lastName,
      required String profilePicturePath});
}
