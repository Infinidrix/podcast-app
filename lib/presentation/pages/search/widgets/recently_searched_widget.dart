import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/pages/search/widgets/custom_text.dart';

class Recently extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;

  const Recently({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: RecentlySearchedItem(img: img, title: title, subtitle: subtitle),
    // );

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
