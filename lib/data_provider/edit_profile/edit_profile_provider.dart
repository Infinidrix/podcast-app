import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_app/data_provider/edit_profile/i_edit_profile_provider.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';
import 'package:podcast_app/models/edit_profile/edit_profile_request.dart';

import '../constants.dart';

class EditProfileProvider implements IEditProfileProvider {
  final http.Client httpClient;

  EditProfileProvider({required this.httpClient});
  @override
  Future<Either<String, UserEditProfile>> updateUserProfile(
      EditProilfeItems editItems) async {
    // TODO: implement updateUserProfile
    UserEditProfile va = UserEditProfile(
      isCreator: false,
      UserName: "UserName",
      Email: "e@gmail.com",
      FirsName: "FirstName",
      LastName: "last",
      Password: "Password",
      ProfilePicture: 'assets/images/placeholder.jpg',
    );
    Map som = {
      "Email": "kd@gmail.comm",
      "UserName": "thre",
      "Password": "Bini1234,,"
    };
    try {
      await LoginProvider.getSharedPrefernce();
      final id = await LoginProvider.SESSION.getString("userId");
      final response = await httpClient.put(
        Uri.http(URL, "/api/update /${id}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(editItems.user.tojson()),
      );
      String checked = '';
      if (editItems.isCreatorChecked) {
        checked = "/api/user/${id}/role";
      } else {
        checked = "/api/user/${id}/role/delete";
      }

      final responseRole = await httpClient
          .post(Uri.http(URL, checked), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      bool isCreator = false;
      if (responseRole.statusCode == 200) {
        final roles = jsonDecode(responseRole.body);

        print("this the role in login ${roles}");
        if (roles.contains("Creator")) {
          isCreator = true;
        }
      } else {
        print("this is error in edit profile ${responseRole.statusCode}");
      }

      // await LoginProvider.SESSION.setString("useInfo", jsonEncode(va.toJson()));
      // return right(va);
      print("this is in edit provider ${response.statusCode}");
      print("this is the response in edit provider  ${response.body}");
      if (response.statusCode == 200) {
        print("this is the response in edit provider  ${response.body}");
        final userInfo =
            await LoginProvider.getItemFromLocalStorage(tokenName: "userInfo");
        final parsed = jsonDecode(response.body);
        UserEditProfile user = userInfo != null
            ? UserEditProfile.fromJson(jsonDecode(userInfo))
            : va;
        print(parsed);
        user.Email = parsed["email"];
        user.UserName = parsed["userName"];
        user.Password = editItems.user.Password;
        user.isCreator = isCreator;
        await LoginProvider.SESSION
            .setString("userInfo", jsonEncode(user.toJson()));
        print(user.UserName);
        return right(user);
      } else if (response.statusCode == 400) {
        print("this is in edit profile ${response.statusCode}");
        return left(jsonDecode(response.body)["message"]);
      } else if (response.statusCode == 404) {
        return left("there is no internet connection");
      }
    } catch (e) {
      return left("${e.runtimeType}");
    }
    return left("there is no internet connection");
  }

  @override
  Future<Either<String, bool>> deleteUser() async {
    // TODO: implement deleteUser

    try {
      await LoginProvider.getSharedPrefernce();
      final id = await LoginProvider.SESSION.getString("userId");

      final response = await httpClient
          .delete(Uri.http(URL, "/api/user/${id}"), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (response.statusCode == 200) {
        return right(true);
      } else if (response.statusCode == 400) {
        return left(jsonDecode(response.body)["message"]);
      } else if (response.statusCode == 404) {
        return left("there is no internet connection here 404");
      }
    } catch (e) {
      return left("there is no internet connection ${e.runtimeType}");
    }
    return left("there is no internet connection  here");
  }
}
