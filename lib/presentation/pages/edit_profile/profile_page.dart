import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/player/widgets/player_widgets.dart';

class Edit_Profile_Page extends StatelessWidget {
  const Edit_Profile_Page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ABottomNavaigationBar(),
    );
  }
}