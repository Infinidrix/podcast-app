import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/sugnup/i_signup_provider.dart';
import 'package:podcast_app/models/user_login/user_login.dart';
import 'package:podcast_app/models/user_register/user_register.dart';
import 'package:podcast_app/repository/signup%20repository/i_signup_repository.dart';

class SignupRepository implements ISignupRepository {
  final ISignupProvider signupProvider;

  SignupRepository({required this.signupProvider});

  @override
  Future<Either<String, UserRegister>> signup(
      {required String email,
      required String userName,
      required String password,
      required String firstName,
      required String lastName,
      required String profilePicturePath}) async {
    // TODO: implement signup
    final userRegister = UserRegister(
      username: userName,
      email: email,
      first_name: firstName,
      password: password,
      last_name: lastName,
    );
    final userCred = UserLogin(
        username: userRegister.username, password: userRegister.password);
    return await signupProvider.signUp(
        userRegisterInfo: userRegister.toJson(), userCred: userCred.toJson());
  }
}
