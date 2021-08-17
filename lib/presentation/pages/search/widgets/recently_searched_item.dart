import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/pages/search/widgets/custom_text.dart';

class RecentlySearchedItem extends StatelessWidget {
  const RecentlySearchedItem({
    Key? key,
    required this.img,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String img;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: HexColor("#282828"),
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          backgroundImage: AssetImage(img),
          radius: 25,
        ),
        title: CustomText(text: "$title"),
        subtitle: CustomText(text: "$subtitle"),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
