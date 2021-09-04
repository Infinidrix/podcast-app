import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:podcast_app/data_provider/login/ilogin_provider.dart';
import 'package:podcast_app/models/LoginDtoModel.dart';
import 'package:podcast_app/models/user_login/user_login.dart';

import '../constants.dart';

class LoginProvider implements ILoginProvider {
  final http.Client httpClient;
  static final SESSION = LocalStorage('userLoginCredential');
  LoginProvider({required this.httpClient});
  @override
  Future<Either<String, LoginDtoModel>> Login(UserLogin userCred) async {
    try {
      final response = await httpClient.post(
        Uri.http(URL, "/api/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userCred.toJson()),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        await setItemToLocalStrage(
            tokenName: "userCred", dataToStore: userCred.toJson());
        await setItemToLocalStrage(tokenName: "user", dataToStore: parsed);
        return right(LoginDtoModel.fromJson(parsed));
      } else if (response.statusCode == 400) {
        final parsed = json.decode(response.body);
        print(parsed);
        return left(parsed["error"]);
      } else if (response.statusCode == 404) {
        return left("Can not connect to internet");
      }
      return left("Some Error Happened");
    } catch (e) {
      return left("Can not connect to internet ${e.runtimeType}");
    }
  }

  static Future setItemToLocalStrage<T>(
      {required String tokenName, required T dataToStore}) async {
    await SESSION.setItem(tokenName, dataToStore);
  }

  static Future<Either<Unit, Map<String, dynamic>>> getItemFromLocalStorage(
      {required String tokenName}) async {
    final value = await SESSION.getItem(tokenName);
    if (value != null) {
      return right(value);
    }
    return left(unit);
  }
}

//
// final parsed = json.decode(response.body);
// print(await getItemFromLocalStorage(tokenName: "user"));
//
