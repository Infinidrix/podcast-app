import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/signup/widgets/signup_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return SignupWidget();
  }
}
