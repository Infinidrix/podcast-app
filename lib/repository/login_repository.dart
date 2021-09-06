import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/login/ilogin_provider.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/LoginDtoModel.dart';
import 'package:podcast_app/models/user_login/user_login.dart';
import 'package:podcast_app/repository/ilogin_repository.dart';

class LoginRepository implements ILoginRepository {
  final ILoginProvider loginDataProvider;

  LoginRepository({required this.loginDataProvider});

  @override
  Future<Either<String, LoginDtoModel>> Login(
      String email, String password) async {
    print('in login repo ${email} $password');
    final userCred = UserLogin(UserName: email, Password: password);
    return await loginDataProvider.Login(userCred);
    // TODO: implement Login
  }

  @override
  Future<UserLogin?> getPersistedUserCredOrNot() async {
    // TODO: implement getPersistedUserCredOrNot

    final userCredFromLocalStorage =
        await LoginProvider.getItemFromLocalStorage(tokenName: "userCred");
    print("\n\n");
    print(userCredFromLocalStorage);
    if (userCredFromLocalStorage == null) {
      return null;
    }

    return UserLogin.fromJson(jsonDecode(userCredFromLocalStorage));

    // UserLogin? ret;

    // await userCredFromLocalStorage.fold((l) {}, (r) {
    //   ret = UserLogin.fromJson(r);
    // });
    // // if (userCred is UserLogin) {
    // //   return right(userCred);
    // // }
    // print('del');
    // if (ret == null) {
    //   return left(unit);
    // }
    // return right(ret!);
  }
}
