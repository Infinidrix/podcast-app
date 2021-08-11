import 'package:auto_route/auto_route.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CreateChannelWidget extends StatelessWidget {
  Widget emailInput = Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
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

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {
            context.router.pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Center(
                child: Text("Save"),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Create Channel",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 105.0),
              ),
              Text(
                "Channel Name",
                style: TextStyle(color: Colors.grey),
              ),
              emailInput,
              Text(
                "Channel Name",
                style: TextStyle(color: Colors.grey),
              ),
              emailInput,
              Text(
                "Channel Name",
                style: TextStyle(color: Colors.grey),
              ),
              emailInput,
              signinButton,
            ],
          ),
        ),
      ),
    );
  }
}
