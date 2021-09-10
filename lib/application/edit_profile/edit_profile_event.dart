// import 'package:image_picker/image_picker.dart';
part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileEvent {}

class SaveButtonPressedEditProfileEvent extends EditProfileEvent {
  bool isChekced;
  final String UserName, Email, Password, ProfilePicture;

  SaveButtonPressedEditProfileEvent(
      {required this.UserName,
      required this.Email,
      required this.Password,
      required this.ProfilePicture,
      required this.isChekced});
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

class CreatorBoxPressedEvent extends EditProfileEvent {
  final bool isChecked;

  CreatorBoxPressedEvent({required this.isChecked});
}

class DeleteUserButtonPressed extends EditProfileEvent {}

class LogOutButtonPressed extends EditProfileEvent {}
