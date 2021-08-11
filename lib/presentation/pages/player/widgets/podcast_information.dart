import 'package:flutter/material.dart';

class PodcastInformation extends StatelessWidget {
  const PodcastInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: TextDirection.ltr,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Text(
                "742. The Thing I'm getting Over",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "This American Life",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                ),
              )
            ],
          ),
        ),
        Icon(
          Icons.file_download_outlined,
          color: Colors.white,
          textDirection: TextDirection.ltr,
        )
      ],
    );
  }
}
