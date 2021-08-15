import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/edit_profile/widgets/edit_profile_widget.dart';
import 'package:podcast_app/presentation/pages/player/widgets/player_widgets.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditProfileWidget(
    ),
      bottomNavigationBar: ABottomNavaigationBar(),
    );
  }
}