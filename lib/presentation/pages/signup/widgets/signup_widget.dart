import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignupWidget extends StatelessWidget {
  Widget emailInput = Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
    child: TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        // labelText: "Email",
        // labelStyle: TextStyle(color: Colors.white),
        helperStyle: TextStyle(color: Colors.white),
        hintText: 'email',
        hintStyle: TextStyle(color: Colors.white),
        // filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        fillColor: Colors.white,
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Colors.white,
        ),
      ),
    ),
  );

  Widget passwordInput = Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: TextFormField(
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          // labelText: "Email",
          // labelStyle: TextStyle(color: Colors.white),
          helperStyle: TextStyle(color: Colors.white),
          hintText: '.........',
          hintStyle: TextStyle(color: Colors.white, fontSize: 20.0),
          // filled: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
          suffixIcon: Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.white,
          )),
    ),
  );

  Widget usernameInput = Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 45.0),
    child: TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        // labelText: "Email",
        // labelStyle: TextStyle(color: Colors.white),
        helperStyle: TextStyle(color: Colors.white),
        hintText: 'john',
        hintStyle: TextStyle(color: Colors.white),
        // filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        fillColor: Colors.white,
        prefixIcon: Icon(
          Icons.person_outline,
          color: Colors.white,
        ),
      ),
    ),
  );

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
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () {},
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

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(43.0, 185.0, 43.0, 0.0),
          child: Container(
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
                signinButton,
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
                        onPressed: () {},
                        child: Text("Signin",style: TextStyle(color: HexColor("#579EB5"))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}