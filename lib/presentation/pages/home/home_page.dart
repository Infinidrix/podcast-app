import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/home/widgets/home_page_widget.dart';

// import 'package:podcast_app/assets';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  final String title = "Podcast App";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset(
            "assets/images/welcome.png",
            height: 343,
          ),
          HomeWidget(),
        ],
      ),
    );
  }
}
