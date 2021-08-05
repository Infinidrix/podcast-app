import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/signup/widgets/signup_widget.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SignupWidget();
  }
}
