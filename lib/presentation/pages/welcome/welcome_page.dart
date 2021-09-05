import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/welcome/widgets/welcome_page_widget.dart';

// import 'package:podcast_app/assets';
class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  final String title = "Podcast App";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WelcomeWidget(),
    );
  }
}
