import 'package:flutter/material.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/presentation/pages/edit_channel/widgets/recently_uploaded_podcast_tile.dart';

class RecentlyUploadedPodcastsList extends StatelessWidget {
  const RecentlyUploadedPodcastsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return RecentlyUploadedPodcast(
              podcast: Podcast(
                  channelName: "Joe Rogan",
                  name: "Guy Raz",
                  description: "",
                  id: "",
                  url: ""));
        },
        childCount: 20,
      ),
    );
  }
}
