import 'package:flutter/material.dart';
import 'package:podcast_app/models/edit_profile/edit_profile.dart';
import 'package:podcast_app/presentation/pages/core/bottom_nav.dart';
import 'package:podcast_app/presentation/pages/edit_profile/widgets/edit_profile_widget.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key, required this.user}) : super(key: key);
  // EditProfilePage({required this.user});
  UserEditProfile user;
  @override
  Widget build(BuildContext context) {
    print('this is from EritProfilePage to print userInfo$user');
    return Scaffold(
      body: EditProfileWidget(user: user),
      bottomNavigationBar: getBottomNavBar(context),
    );
  }
}
