part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileState {
  final UserEditProfile user;
  EditProfileState({required this.user});
}

class InitialEditProfileState extends EditProfileState {
  final bool isShown;
  InitialEditProfileState({required user, required this.isShown})
      : super(user: user);
}

class LoadingEditProfileState extends EditProfileState {
  LoadingEditProfileState({required user}) : super(user: user);
}

class ErrorStateEditProfileState extends EditProfileState {
  final String ErrorMessage;

  ErrorStateEditProfileState({required this.ErrorMessage, required user})
      : super(user: user);
}

class SuccesEditProfileState extends EditProfileState {
  SuccesEditProfileState({required user}) : super(user: user);
}

class HiddenRrShownPasswordEditProfileState extends EditProfileState {
  final bool isPasswordShown;
  HiddenRrShownPasswordEditProfileState(
      {required this.isPasswordShown, required user})
      : super(user: user);
}

class RequestToChangeProfileImageState extends EditProfileState {
  RequestToChangeProfileImageState({required user}) : super(user: user);
}

class FetchingEditProfileState extends EditProfileState {
  FetchingEditProfileState({required user}) : super(user: user);
}

class ChangeRoleCheckBoxState extends EditProfileState {
  final bool isChecked;

  ChangeRoleCheckBoxState({required user, required this.isChecked})
      : super(user: user);
}

class NavigateToWellcomePageState extends EditProfileState {
  NavigateToWellcomePageState({required user}) : super(user: user);
}

class LoadingButtonEditProfileState extends EditProfileState {
  LoadingButtonEditProfileState({required user}) : super(user: user);
}