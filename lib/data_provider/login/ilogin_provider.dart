import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/LoginDtoModel.dart';
import 'package:podcast_app/models/user_login/user_login.dart';

abstract class ILoginProvider {
  Future<Either<String, LoginDtoModel>> Login(UserLogin userCred);

  // static Future setItemToLocalStrage<T>(
  //     {required String tokenName, required T dataToStore});
  // Future<Map<String, dynamic>> getItemFromLocalStorage(
  //     {required String tokenName});
}
