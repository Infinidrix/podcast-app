import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';
import 'package:podcast_app/repository/edit_profile_repository/i_edit_profile_repository.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  UserEditProfile temp = UserEditProfile(
    UserName: "UserName",
    Email: "e@gmail.com",
    FirsName: "FirstName",
    LastName: "last",
    Password: "Password",
    ProfilePicture: 'assets/images/placeholder.jpg',
  );

  final IEditProfileRepository editProfileRepository;
  EditProfileBloc({required this.editProfileRepository})
      : super(FetchingEditProfileState(
            user: UserEditProfile(
          UserName: "",
          Email: "som",
          FirsName: "FirstName",
          LastName: "last",
          Password: "Password",
          ProfilePicture: 'assets/images/placeholder.jpg',
        )));

  @override
  Stream<EditProfileState> mapEventToState(EditProfileEvent event) async* {
    // TODO: Add your event logic

    // va = await editProfileRepository.updateUserProfile(userEditProfile)
    final userInfo =
        await LoginProvider.getItemFromLocalStorage(tokenName: "userInfo");
    UserEditProfile va = userInfo != null
        ? UserEditProfile.fromJson(jsonDecode(userInfo))
        : temp;
    print("in edit profile bloc ${userInfo}");
    final _picker = ImagePicker();
    yield InitialEditProfileState(user: va, isShown: true);

    if (event is SaveButtonPressedEditProfileEvent) {
      va.Password = event.Password;
      va.UserName = event.UserName;
      va.Email = event.Email;
      va.ProfilePicture = event.ProfilePicture;
      yield LoadingEditProfileState(user: va);
      print("profile ${va.ProfilePicture}");
      print("profile ${va.UserName}");
      print("profile ${va.Email}");

      if (va.Email == event.Email) {
        yield SuccesEditProfileState(user: va);
      } else {
        yield ErrorStateEditProfileState(
            ErrorMessage: "ErrorMessage", user: va);
      }
      yield InitialEditProfileState(user: va, isShown: true);
    } else if (event is PasswordShowButtonPressedEditProfileEvent) {
      yield HiddenRrShownPasswordEditProfileState(
          isPasswordShown: !event.isPassword, user: va);
    } else if (event is IntitalEditProfileEvent) {
      final userInfo =
          await LoginProvider.getItemFromLocalStorage(tokenName: "userInfo");
      print("first ${userInfo}");
      va = userInfo != null
          ? UserEditProfile.fromJson(jsonDecode(userInfo))
          : va;
      yield InitialEditProfileState(user: va, isShown: true);
    } else if (event is ChangeProfileImageButtonPressed) {
      yield RequestToChangeProfileImageState(user: va);
    } else if (event is OpenImagePickerEvent) {
      yield InitialEditProfileState(user: va, isShown: true);
      final pickedImage = await _picker.getImage(source: event.imageSource);
      if (pickedImage == null) {
        yield ErrorStateEditProfileState(
            ErrorMessage: "ErrorMessage", user: va);
      } else {
        va.ProfilePicture = pickedImage.path;

        yield InitialEditProfileState(user: va, isShown: true);
      }
    }
  }
}
