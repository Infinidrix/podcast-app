import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/edit_profile/i_edit_profile_provider.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';

class EditProfileProvider implements IEditProfileProvider {
  @override
  Future<Either<String, UserEditProfile>> updateUserProfile(
      UserEditProfile userEditProfile) async {
    // TODO: implement updateUserProfile
    UserEditProfile va = UserEditProfile(
      UserName: "UserName",
      Email: "e@gmail.com",
      FirsName: "FirstName",
      LastName: "last",
      Password: "Password",
      ProfilePicture: 'assets/images/placeholder.jpg',
    );
    try {
      await LoginProvider.SESSION.setString("useInfo", jsonEncode(va.toJson()));
      return right(va);
    } catch (e) {
      return left("${e.runtimeType}");
    }
    throw UnimplementedError();
  }
}
