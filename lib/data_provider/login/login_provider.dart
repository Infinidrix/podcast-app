import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
// import 'package:localstorage/localstorage.dart';
import 'package:podcast_app/data_provider/login/ilogin_provider.dart';
import 'package:podcast_app/models/LoginDtoModel.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';
import 'package:podcast_app/models/user_login/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class LoginProvider implements ILoginProvider {
  final http.Client httpClient;
  // static final SESSION = LocalStorage('userLoginCredential');
  static late SharedPreferences SESSION;
  LoginProvider({required this.httpClient}) {
    getSharedPrefernce();
  }
  static Future getSharedPrefernce() async {
    SESSION = await SharedPreferences.getInstance();
  }

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
        await getSharedPrefernce();
        await setItemToLocalStrage(
            tokenName: "userCred", dataToStore: jsonEncode(userCred.toJson()));
        print("this is the thing i want ${parsed}");
        await setItemToLocalStrage(
            tokenName: "token", dataToStore: parsed["token"]);
        print(
            "this is the  user token ${parsed["token"]} u can get it every where ");
        await setItemToLocalStrage(
            tokenName: "roles",
            dataToStore: jsonEncode(parsed['user']['roles']));
        final roles = parsed['user']['roles'];
        print("this the role in login ${roles}");
        bool isCreator = false;
        if (roles.contains("Creator")) {
          isCreator = true;
        }
        await setItemToLocalStrage(
            tokenName: "user", dataToStore: response.body);
        await setItemToLocalStrage(
            tokenName: "userId", dataToStore: parsed['user']['id']);

        final id = parsed['user']['id'];
        final image = "http://192.168.0.131:44343/api/update/profile/${id}";

        final userInfo = UserEditProfile(
            ProfilePicture: image,
            UserName: parsed['user']["userName"],
            Email: parsed['user']['email'],
            Password: "",
            FirsName: parsed['user']["firstName"],
            LastName: parsed['user']["lastName"],
            isCreator: isCreator);
        userInfo.Password = userCred.Password;
        await setItemToLocalStrage(
            tokenName: "userInfo", dataToStore: jsonEncode(userInfo.toJson()));
        return right(LoginDtoModel.fromJson(parsed));
      } else if (response.statusCode == 400) {
        final parsed = json.decode(response.body);
        print(parsed);

        return left(parsed["error"]);
      } else if (response.statusCode == 404) {
        return left("Can not connect to internet");
      }
      return left("Some Error Happened");
    } on CastError catch (e) {
      return left("Can not connect to internet ${e.runtimeType} add ${e}");
    }
  }

  static Future setItemToLocalStrage(
      {required String tokenName, required String dataToStore}) async {
    await SESSION.setString(tokenName, dataToStore);
  }

  static Future<String?> getItemFromLocalStorage(
      {required String tokenName}) async {
    return await SESSION.getString(tokenName);
  }
}

//
// final parsed = json.decode(response.body);
// print(await getItemFromLocalStorage(tokenName: "user"));
//
