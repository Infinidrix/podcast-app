import 'package:dartz/dartz.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';

abstract class IEditProfileRepository {
  Future<Either<String, UserEditProfile>> updateUserProfile(
      UserEditProfile userEditProfile);
}
