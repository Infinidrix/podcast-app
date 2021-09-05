import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';

abstract class IEditProfileProvider {
  Future<Either<String, UserEditProfile>> updateUserProfile(
      UserEditProfile userEditProfile);
}
