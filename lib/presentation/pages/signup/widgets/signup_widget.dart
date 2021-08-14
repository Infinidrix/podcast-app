import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:podcast_app/presentation/core/constants.dart';

class SignupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    // the email field widget
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

    // the password field widget
    Widget passwordInput = Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: textfieldDecoration.copyWith(
          hintText: ".........",
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
          suffixIcon: Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.white,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field can't be empty";
          } else if (value.length < 8) {
            return "Password must have aleast 8 characters!";
          }
          return null;
        },
      ),
    );

    // the username field widget
    Widget usernameInput = Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
      child: TextFormField(
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
      ),
    );

    // the signup button
    Widget signupButton = Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [HexColor("#579EB5"), HexColor("#8EB9C7")]),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              print("Successfully registered!");
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text("Sign Up"),
                  ),
                  Icon(Icons.arrow_forward_sharp),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(43.0, 185.0, 43.0, 0.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Getting started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
                  child: Text(
                    "Create an account to continue!",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Text(
                  "Email",
                  style: TextStyle(color: Colors.grey),
                ),
                emailInput,
                Text(
                  "Username",
                  style: TextStyle(color: Colors.grey),
                ),
                usernameInput,
                Text(
                  "Password",
                  style: TextStyle(color: Colors.grey),
                ),
                passwordInput,
                signupButton,
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          context.router.push(SigninRoute());
                        },
                        child: Text("Signin",
                            style: TextStyle(color: HexColor("#579EB5"))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
