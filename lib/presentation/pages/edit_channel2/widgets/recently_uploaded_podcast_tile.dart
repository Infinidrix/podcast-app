import 'package:flutter/material.dart';

import 'package:podcast_app/models/Podcast.dart';

class RecentlyUploadedPodcast extends StatelessWidget {
  Podcast podcast;
  RecentlyUploadedPodcast({
    Key? key,
    required this.podcast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(podcast.imageUrl!),
        title: Text(podcast.name),
        subtitle: Text(podcast.description),
        trailing: PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              // TODO : REDIRECT TO EDIT OR CALL DELETE FUNCTION
              print("VALUE $value");
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.edit,
                                color: Colors.amber[100], size: 18),
                          ),
                          TextSpan(
                              text: "  Edit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child:
                                Icon(Icons.delete, color: Colors.red, size: 18),
                          ),
                          TextSpan(
                            text: " Delete",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    value: 2,
                  ),
                ]));
  }
}

// return Padding(
//       padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//       child: Row(
//         children: [
//           Image.asset(
//             podcast.imageUrl!,
//             height: 50,
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(podcast.name),
//                   Text(podcast.numberOfListeners.toString()),
//                 ],
//               ),
//             ),
//           ),
//           Icon(Icons.more_horiz)
//         ],
//       ),
//     );
