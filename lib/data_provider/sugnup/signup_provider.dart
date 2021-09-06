import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/data_provider/sugnup/i_signup_provider.dart';
import 'package:podcast_app/models/user_register/user_register.dart';

import '../constants.dart';

class SignupProvider implements ISignupProvider {
  final http.Client httpClient;

  SignupProvider({required this.httpClient});
  @override
  Future<Either<String, UserRegister>> signUp(
      {required Map<String, dynamic> userRegisterInfo,
      required Map<String, dynamic> userCred}) async {
    // TODO: implement signUp
    print(userRegisterInfo);
    print(json.encode(userRegisterInfo));
    try {
      final response = await httpClient.post(
        Uri.http(URL, "/api/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userRegisterInfo),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        print(parsed);
        await LoginProvider.getSharedPrefernce();
        await LoginProvider.setItemToLocalStrage(
            tokenName: "userCred", dataToStore: jsonEncode(userCred));
        return right(UserRegister.fromJson(parsed));
      } else if (response.statusCode == 400) {
        final parsed = json.decode(response.body);
        return left(parsed["message"]);
      } else if (response.statusCode == 404) {
        return left("Can not connect to internet");
      }
      return left("Some Error Happened");
    } on SocketException catch (e) {
      print(e.message);
      return left("Can not connect to internet ${e.runtimeType}");
    }
  }
}
