import 'package:flutter/material.dart';
import 'recently_searched_item.dart';

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
    return Container(
      child: RecentlySearchedItem(img: img, title: title, subtitle: subtitle),
    );
  }
}
