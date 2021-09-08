// import 'package:image_picker/image_picker.dart';
part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileEvent {}

class SaveButtonPressedEditProfileEvent extends EditProfileEvent {
  final String UserName, Email, Password, ProfilePicture;

  SaveButtonPressedEditProfileEvent(
      {required this.UserName,
      required this.Email,
      required this.Password,
      required this.ProfilePicture});
}

class IntitalEditProfileEvent extends EditProfileEvent {}

class PasswordShowButtonPressedEditProfileEvent extends EditProfileEvent {
  final bool isPassword;

  PasswordShowButtonPressedEditProfileEvent({required this.isPassword});
}

class ChangeProfileImageButtonPressed extends EditProfileEvent {}

class OpenImagePickerEvent extends EditProfileEvent {
  final ImageSource imageSource;
  OpenImagePickerEvent({required this.imageSource});
}
