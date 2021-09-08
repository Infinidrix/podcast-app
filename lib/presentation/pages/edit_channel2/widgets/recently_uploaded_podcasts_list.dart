import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/edit_channel2/widgets/recently_uploaded_podcast_tile.dart';

class RecentlyUploadedPodcastsList extends StatelessWidget {
  const RecentlyUploadedPodcastsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return RecentlyUploadedPodcast();
        },
        childCount: 20,
      ),
    );
  }
}
