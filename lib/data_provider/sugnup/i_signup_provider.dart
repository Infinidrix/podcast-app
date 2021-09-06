import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/user_register/user_register.dart';

abstract class ISignupProvider {
  Future<Either<String, UserRegister>> signUp(
      {required Map<String, dynamic> userRegisterInfo,
      required Map<String, dynamic> userCred});
}
