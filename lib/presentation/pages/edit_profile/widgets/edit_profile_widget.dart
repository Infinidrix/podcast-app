import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:podcast_app/application/edit_profile/edit_profile_bloc.dart';
import 'package:podcast_app/presentation/core/constants.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final editProfileBloc = BlocProvider.of<EditProfileBloc>(context);
    editProfileBloc.add(IntitalEditProfileEvent());
    final _formKey = GlobalKey<FormState>();
    final editBloc = BlocProvider.of<EditProfileBloc>(context);
    late String _email = '';
    late String _userName = '';
    late String _password = '';
    bool _isPasswordObsecure = true;

    Widget username() {
      return TextFormField(
        initialValue: _userName,
        style: TextStyle(color: Colors.white),
        decoration: textfieldDecoration.copyWith(
          hintText: "John",
          prefixIcon: Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field can't be empty";
          }
          return null;
        },
        onChanged: (value) {
          _userName = value;
        },
      );
    }

    Widget emailInput(EditProfileState state) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
        child: TextFormField(
            initialValue: state.user.Email,
            style: TextStyle(color: Colors.white),
            decoration: textfieldDecoration,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field can't be empty";
              } else if (!EmailValidator.validate(value)) {
                return "Invalid email";
              }
              return null;
            },
            onChanged: (value) {
              _email = value;
            }),
      );
    }

    Widget _saveButton(EditProfileState state) {
      return DecoratedBox(
        decoration: buttonDecoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            // checking if the form submitted is valid
            if (_formKey.currentState!.validate()) {
              print("Successfully cancelled");
              SaveButtonPressedEditProfileEvent ev =
                  SaveButtonPressedEditProfileEvent(
                UserName: _userName,
                Email: _email,
                Password: _password,
                ProfilePicture: 'assets/images/placeholder.jpg',
              );
              editBloc.add(ev);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text("Save"),
            ),
          ),
        ),
      );
    }

    Widget _passwordInput(EditProfileState state) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
        child: TextFormField(
          initialValue: _password,
          obscureText: _isPasswordObsecure,
          style: TextStyle(color: Colors.white),
          decoration: textfieldDecoration.copyWith(
            hintText: "............",
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Colors.white,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                print('eye');
                PasswordShowButtonPressedEditProfileEvent ev =
                    PasswordShowButtonPressedEditProfileEvent(
                        isPassword: !_isPasswordObsecure);
                _isPasswordObsecure = !_isPasswordObsecure;
                editBloc.add(ev);
              },
              child: Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.white,
              ),
            ),
          ),
          validator: (value) {
            return isPasswordValid(value!);
          },
          onChanged: (value) {
            _password = value;
          },
        ),
      );
    }

    editProfileBloc.add(IntitalEditProfileEvent());

    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is FetchingEditProfileState) {
          editProfileBloc.add(IntitalEditProfileEvent());
        }
        if (state is SuccesEditProfileState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("success"),
            duration: Duration(seconds: 3),
          ));
        }
        if (state is ErrorStateEditProfileState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.ErrorMessage),
            duration: Duration(seconds: 3),
          ));
        }
        if (state is RequestToChangeProfileImageState) {
          _showImageSourceActionSheet(context);
        }
      },
      builder: (context, state) {
        if (state is InitialEditProfileState) {
          _email = state.user.Email;
          _userName = state.user.UserName;
          _password = state.user.Password;
        }
        print(_userName);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 47.5),
          child: Container(
            child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    _getProfilePicture(state, editProfileBloc),
                    Padding(
                      padding: const EdgeInsets.only(top: 73.3),
                      child: Text(
                        "Username",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 33.3),
                      child: username(),
                    ),
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.grey),
                    ),
                    emailInput(state),
                    Text(
                      "Password",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: _passwordInput(state),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: _saveButton(state),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  void _showImageSourceActionSheet(BuildContext context) {
    print('some');
    Function(ImageSource) selectImageSource = (imageSource) {
      context
          .read<EditProfileBloc>()
          .add(OpenImagePickerEvent(imageSource: imageSource));
    };
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(children: [
        ListTile(
          leading: Icon(Icons.camera_alt),
          title: Text('Camera'),
          onTap: () {
            Navigator.pop(context);
            selectImageSource(ImageSource.camera);
          },
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Gallery'),
          onTap: () {
            Navigator.pop(context);
            selectImageSource(ImageSource.gallery);
          },
        ),
      ]),
    );
  }

  Widget _getProfilePicture(
      EditProfileState state, EditProfileBloc editProfileBloc) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 73.0),
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: CircleAvatar(
              radius: 60,
              // backgroundImage: (state is InitialEditProfileState)
              //     ? AssetImage(state.user.ProfilePicture)
              //     : AssetImage("assets/images/welcome.png"),
              // FileImage(File(state.user.ProfilePicture)),

              child: Stack(alignment: Alignment.center, children: [
                Icon(
                  Icons.add,
                  size: 40.0,
                )
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: TextButton(
            child: Text(
              "Change Profile Picture",
              style: TextStyle(color: HexColor("#579EB5")),
            ),
            onPressed: () {
              editProfileBloc.add(ChangeProfileImageButtonPressed());
            },
          ),
        )
      ],
    );
  }

  String? isPasswordValid(String password, [int minLength = 8]) {
    if (password == null || password.length < minLength) {
      return "Password length should be 8 and above";
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    if (hasUppercase) {
      bool hasDigits = password.contains(RegExp(r'[0-9]'));
      if (hasDigits) {
        bool hasLowercase = password.contains(RegExp(r'[a-z]'));
        if (hasLowercase) {
          bool hasSpecialCharacters =
              password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
          // return hasSpecialCharacters;
          if (hasSpecialCharacters) {
            return null;
          } else {
            return "Password should contain Special Characters";
          }
        } else {
          return "Password should contain lowercase letters";
        }
      } else {
        return "Password Should have digits";
      }
    }
    return "Password should contain upercase letters";
  }
}
