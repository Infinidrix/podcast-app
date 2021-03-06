import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/application/login/login_bloc.dart';
import 'package:podcast_app/presentation/core/constants.dart';
import 'package:podcast_app/presentation/pages/core/validator.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class SigninWidget extends StatelessWidget {
  late String userName;
  late String password;
  late bool isPasswordObsecure = true;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final homeBloc = BlocProvider.of<HomePageBloc>(context);

    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (_, loginState) {
          if (loginState is ErrorFailureLoginState) {
            // FlushbarHelper.createError(message: loginState.errorMessage)
            //     .show(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(loginState.errorMessage),
              duration: Duration(seconds: 3),
            ));
          }
          if (loginState is LoginSuccessState) {
            homeBloc.add(LoadIntialHomeEvent());
            context.router.replace(HomeRoute());
          }
        },
        builder: (_, loginState) {
          loginBloc.add(CheckUserCredPersistedLoginEvent());
          return Padding(
            padding: const EdgeInsets.fromLTRB(55.0, 218.0, 55.0, 0.0),
            child: Container(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Text(
                      "Let's Sign You In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
                      child: Text(
                        "Welcome back,you've been missed!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Text(
                      "Username",
                      style: TextStyle(color: Colors.grey),
                    ),
                    // Email Text Field

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
                      child: TextFormField(
                        key: Key('email_field'),
                        style: TextStyle(color: Colors.white),
                        decoration: textfieldDecoration,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field can't be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          userName = value;
                        },
                      ),
                    ),

                    // Email Text Field
                    Text(
                      "Password",
                      style: TextStyle(color: Colors.grey),
                    ),
                    // the password text field

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        key: Key('password_field'),
                        obscureText: isPasswordObsecure,
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
                              ShowOrHiddenPasswordButtonPressedLoginEvent ev =
                                  ShowOrHiddenPasswordButtonPressedLoginEvent(
                                      isShown: !isPasswordObsecure);
                              isPasswordObsecure = !isPasswordObsecure;
                              loginBloc.add(ev);
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
                          password = value;
                        },
                      ),
                    ),

                    // the password text field
                    // signin button
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
                          key: Key("signinButton"),
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
                            // checking if the form submitted is valid
                            if (_formKey.currentState!.validate()) {
                              print("Successfully signed in!");
                              LoginButtonPressedEvent ev =
                                  LoginButtonPressedEvent(
                                      userName: this.userName,
                                      password: this.password);
                              loginBloc.add(ev);
                              if (loginState is LoginSuccessState) {
                                context.router.replace(EditChannelRoute());
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
                                    child: Text("Sign In"),
                                  ),
                                  (loginState is LoadingLoginState)
                                      ? CircularProgressIndicator()
                                      : Icon(Icons.arrow_forward_sharp),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SignIn button
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            key: Key("signupButton"),
                            onPressed: () {
                              context.router.push(SignupRoute());
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                color: HexColor("#579EB5"),
                              ),
                            ),
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
