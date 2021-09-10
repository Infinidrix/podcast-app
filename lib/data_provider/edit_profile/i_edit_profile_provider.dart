import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';
import 'package:podcast_app/models/edit_profile/edit_profile_request.dart';

abstract class IEditProfileProvider {
  Future<Either<String, UserEditProfile>> updateUserProfile(
      EditProilfeItems userEditProfile);
  Future<Either<String, bool>> deleteUser();
  Future<Either<String, bool>> uploadProfile(dynamic profile);
}
