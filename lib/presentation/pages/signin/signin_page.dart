import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/signin/widgets/signin_page_widget.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return SigninWidget();
  }
}
