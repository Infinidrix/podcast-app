import 'package:flutter/material.dart';

class RecentlyUploadedPodcast extends StatelessWidget {
  const RecentlyUploadedPodcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: [
          Image.asset(
            "assets/images/1by1.png",
            height: 50,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Awake"),
                  Text("1123455"),
                ],
              ),
            ),
          ),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}
