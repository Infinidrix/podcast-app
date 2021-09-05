import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/LoginDtoModel.dart';
import 'package:podcast_app/models/user_login/user_login.dart';

abstract class ILoginRepository {
  Future<Either<String, LoginDtoModel>> Login(String email, String password);
  Future<UserLogin?> getPersistedUserCredOrNot();
}
