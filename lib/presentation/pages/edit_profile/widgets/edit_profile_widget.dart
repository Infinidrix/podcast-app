import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/core/constants.dart';
import 'package:podcast_app/presentation/pages/edit_profile/widgets/profile_picture.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    Widget username = TextFormField(
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
    );

    Widget emailInput = Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: textfieldDecoration,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field can't be empty";
          } else if (!value.contains("@") || !value.contains(".com")) {
            return "Invalid email";
          }
          return null;
        },
      ),
    );

    Widget cancelButton = DecoratedBox(
      decoration: buttonDecoration,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () {
          // checking if the form submitted is valid
          if (_formKey.currentState!.validate()) {
            print("Successfully cancelled");
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Text("Cancel"),
          ),
        ),
      ),
    );

    Widget saveButton = DecoratedBox(
      decoration: buttonDecoration,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () {
          // checking if the form submitted is valid
          if (_formKey.currentState!.validate()) {
            print("Successfully saved");
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 47.5),
      child: Container(
        child: Form(
          key: _formKey,
            child: ListView(
          children: [
            ChangeProfilePricture(),
            Padding(
              padding: const EdgeInsets.only(top: 73.3),
              child: Text(
                "Username",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 33.3),
              child: username,
            ),
            Text(
              "Email",
              style: TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 33.0),
              child: emailInput,
            ),
            cancelButton,
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: saveButton,
            )
          ],
        )),
      ),
    );
  }
}
