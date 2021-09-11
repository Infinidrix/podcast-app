import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/signup/signup_bloc.dart';
import 'package:podcast_app/presentation/core/constants.dart';
import 'package:podcast_app/presentation/pages/core/validator.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class SignupWidget extends StatelessWidget {
  late String _email;
  late String _userName;
  late String _password;
  bool _isPasswordShown = true;

  @override
  Widget build(BuildContext context) {
    final singUpBloc = BlocProvider.of<SignupBloc>(context);
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, signupState) {
          // TODO: implement listener
          if (signupState is ErrorFailureSignupState) {
            // FlushbarHelper.createError(message: loginState.errorMessage)
            //     .show(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(signupState.ErrorMessage),
              duration: Duration(seconds: 3),
            ));
          }
          if (signupState is SuccessSignupState) {
            context.router.push(SigninRoute());
          }
        },
        builder: (context, signupState) {
          return Padding(
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
                    // emailInput,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
                      child: TextFormField(
                        key: Key("emailSignUp"),
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
                        },
                      ),
                    ),
                    // email input
                    Text(
                      "Username",
                      style: TextStyle(color: Colors.grey),
                    ),
                    // usernameInput
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
                      child: TextFormField(
                          key: Key("userNameSignup"),
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
                          }),
                    ),
                    // username input
                    Text(
                      "Password",
                      style: TextStyle(color: Colors.grey),
                    ),
                    // passwordInput
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                          key: Key("passwordSignup"),
                          obscureText: _isPasswordShown,
                          style: TextStyle(color: Colors.white),
                          decoration: textfieldDecoration.copyWith(
                            hintText: ".........",
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                print('eye');
                                ShowOrHiddenPasswordButtonPressedSignupEvent
                                    ev =
                                    ShowOrHiddenPasswordButtonPressedSignupEvent(
                                        isPaswordShown: !_isPasswordShown);
                                _isPasswordShown = !_isPasswordShown;
                                singUpBloc.add(ev);
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
                          }),
                    ),
                    // password input

                    // signupButton
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                HexColor("#579EB5"),
                                HexColor("#8EB9C7")
                              ]),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ElevatedButton(
                          key: Key("register"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("Successfully registered!");
                              SignupButtonPressedEvent e =
                                  SignupButtonPressedEvent(
                                      Email: _email,
                                      Password: _password,
                                      UserName: _userName);
                              singUpBloc.add(e);
                              if (signupState is SuccessSignupState) {
                                context.router.push(SigninRoute());
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Text("Sign Up"),
                                  ),
                                  (signupState is LoadingSignupState)
                                      ? CircularProgressIndicator()
                                      : Icon(Icons.arrow_forward_sharp),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //signup button

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
                            key: Key('signin'),
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
          );
        },
      ),
    );
  }
}
