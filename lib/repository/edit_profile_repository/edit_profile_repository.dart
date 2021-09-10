import 'package:dartz/dartz.dart';
import 'package:podcast_app/data_provider/edit_profile/i_edit_profile_provider.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';
import 'package:podcast_app/models/edit_profile/edit_profile_request.dart';
import 'package:podcast_app/repository/edit_profile_repository/i_edit_profile_repository.dart';

class EditProfileRepository implements IEditProfileRepository {
  final IEditProfileProvider editProfileProvider;

  EditProfileRepository({required this.editProfileProvider});

  @override
  Future<Either<String, UserEditProfile>> updateUserProfile(
      EditProilfeItems editItems) {
    // TODO: implement updateUserProfile
    return editProfileProvider.updateUserProfile(editItems);
  }

  @override
  Future<Either<String, bool>> deleteUser() async {
    // TODO: implement deleteUser
    return await editProfileProvider.deleteUser();
  }
}
