import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';
import 'package:podcast_app/models/edit_profile/edit_profile_request.dart';

abstract class IEditProfileRepository {
  Future<Either<String, UserEditProfile>> updateUserProfile(
      EditProilfeItems editItems);
  Future<Either<String, bool>> deleteUser();
}
