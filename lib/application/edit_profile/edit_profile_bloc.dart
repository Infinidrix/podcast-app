import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';
import 'package:podcast_app/models/edit_profile/edit_profile_request.dart';
import 'package:podcast_app/models/edit_profile/user_update_dto.dart';
import 'package:podcast_app/repository/edit_profile_repository/i_edit_profile_repository.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  UserEditProfile temp = UserEditProfile(
    isCreator: false,
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
          isCreator: false,
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

    print(
        'this is \n\n\n ${await LoginProvider.SESSION.getString("userCred")}');

    // va = await editProfileRepository.updateUserProfile(userEditProfile)
    final userInfo =
        await LoginProvider.getItemFromLocalStorage(tokenName: "userInfo");
    UserEditProfile va = userInfo != null
        ? UserEditProfile.fromJson(jsonDecode(userInfo))
        : temp;
    print("in edit profile bloc ${userInfo}");
    final XFile? pickedImage;
    final _picker = ImagePicker();
    yield InitialEditProfileState(user: va, isShown: true);

    if (event is SaveButtonPressedEditProfileEvent) {
      yield LoadingEditProfileState(user: va);
      EditProilfeItems item = EditProilfeItems(
        user: UserUpdate(
          UserName: event.UserName,
          Email: event.Email,
          Password: event.Password,
        ),
        image: null,
        isCreatorChecked: event.isChekced,
      );
      final userOrFailure = await editProfileRepository.updateUserProfile(item);
      yield* userOrFailure.fold((ErrorMessage) async* {
        yield ErrorStateEditProfileState(ErrorMessage: ErrorMessage, user: va);
      }, (user) async* {
        yield SuccesEditProfileState(user: user);
      });
    } else if (event is PasswordShowButtonPressedEditProfileEvent) {
      yield HiddenRrShownPasswordEditProfileState(
          isPasswordShown: !event.isPassword, user: va);
    } else if (event is CreatorBoxPressedEvent) {
      yield ChangeRoleCheckBoxState(isChecked: event.isChecked, user: va);
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
      pickedImage = await _picker.pickImage(source: event.imageSource);
      if (pickedImage == null) {
        yield ErrorStateEditProfileState(
            ErrorMessage: "ErrorMessage", user: va);
      } else {
        va.ProfilePicture = pickedImage.path;
        yield InitialEditProfileState(user: va, isShown: true);
      }
    } else if (event is DeleteUserButtonPressed) {
      yield LoadingButtonEditProfileState(user: va);
      final trueOrError = await editProfileRepository.deleteUser();
      yield* trueOrError.fold((ErrorMessage) async* {
        yield ErrorStateEditProfileState(ErrorMessage: ErrorMessage, user: va);
      }, (r) async* {
        // await LoginProvider.SESSION.clear();
        await LoginProvider.SESSION.setString("userCred", "value");

        yield NavigateToWellcomePageState(user: va);
      });
    } else if (event is LogOutButtonPressed) {
      await LoginProvider.SESSION.setString("userCred", "value");

      // await LoginProvider.SESSION.remove("userCred");
      yield NavigateToWellcomePageState(user: va);
    }
  }
}
