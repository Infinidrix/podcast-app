import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/sign_in/sign_in_bloc.dart';
import 'package:podcast_app/application/sign_in/sign_in_events.dart';
import 'package:podcast_app/application/sign_in/sign_in_states.dart';
import 'package:podcast_app/presentation/core/constants.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SigninWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signinBloc = BlocProvider.of<SignInBloc>(context);
    final _formKey = GlobalKey<FormState>();

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    // the input field widget
    Widget emailInput = Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
      child: TextFormField(
        controller: emailController,
        style: TextStyle(color: Colors.white),
        decoration: textfieldDecoration,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field can't be empty";
          }
          return null;
        },
      ),
    );

    // the password field widget
    Widget passwordInput = Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: textfieldDecoration.copyWith(
          hintText: "............",
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
          }
          return null;
        },
      ),
    );

    // the signin in button
    Widget signinButton = Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [HexColor("#579EB5"), HexColor("#8EB9C7")]),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: BlocConsumer<SignInBloc, LoginState>(
                builder: (_, state) {
                  if (state is LoginLoading){
                    return getElevatedButton(
                      Row(
                        children: [
                          CircularProgressIndicator(),
                          Text("Logging in"),
                        ],
                      ), null);
                  } else if (state is LoginFailed) {
                    return getElevatedButton(Text(state.errorMessage), null );
                  }
                  return getElevatedButton(Text("Sign in"), () { signinBloc.add(LoginEvent(emailController.text, passwordController.text)); });
                }, 
                listener: (ctx, state) => {
                  if (state is LoginSuccess){
                    ctx.router.push(HomeRoute())
                  }
                },
                
                )

      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
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
                  "Email",
                  style: TextStyle(color: Colors.grey),
                ),
                emailInput,
                Text(
                  "Password",
                  style: TextStyle(color: Colors.grey),
                ),
                passwordInput,
                signinButton,
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
      ),
    );
  }

  Widget getElevatedButton(Widget widget, void Function()? param1) {
   return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: param1,
          child: widget,
    ); 
  }
}
