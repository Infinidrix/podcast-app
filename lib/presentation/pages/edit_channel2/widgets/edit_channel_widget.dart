import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/edit_channel/edit_channel_bloc.dart';
import 'package:podcast_app/application/edit_channel/edit_channel_state.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/presentation/core/loading_list_widget.dart';
import 'package:podcast_app/presentation/core/loading_skeleton_text.dart';
// import 'package:podcast_app/presentation/pages/edit_channel/widgets/edit_channel_sliver_app_bar.dart';
import 'package:podcast_app/presentation/pages/edit_channel2/widgets/recently_uploaded_podcast_tile.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

// import 'package:podcast_app/presentation/pages/edit_channel/widgets/recently_uploaded_podcasts_list.dart';

// import '../../edit_channel/widgets/edit_page_description_and_number_of_listeners_tile.dart';

class EditChannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BlocConsumer<EditChannelBloc, EditChannelState>(
          listener: (context, state) {
            if (state is ErrorEditChannelState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                duration: Duration(seconds: 4),
              ));
            }
          },
          builder: (context, state) {
            return SliverAppBar(
              pinned: true,
              expandedHeight: 260,
              flexibleSpace: FlexibleSpaceBar(
                background: FlutterLogo(),
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: (state is LoadingEditChannelState)
                              ? SizedBox(
                                  child: LoadingSkeletonText(),
                                )
                              : (state is LoadedEditChannelState)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state.channel.Name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            context.router.push(CreatePodcastRoute(
                                                channelId:
                                                    "176684b8-461c-41b0-b414-fc0bf49bd8fc"));
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                          ),
                                        )
                                      ],
                                    )
                                  : Text("impossible")),
                    ],
                  ),
                ),
                collapseMode: CollapseMode.parallax,
              ),
            );
          },
        ),
        BlocBuilder<EditChannelBloc, EditChannelState>(
          builder: (context, state) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SizedBox(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: (state is LoadingEditChannelState)
                                  ? SizedBox(
                                      child: LoadingSkeletonText(),
                                    )
                                  : (state is LoadedEditChannelState)
                                      ? Text(
                                          state.channel.Description,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        )
                                      : Text("impossible")),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: (state is LoadingEditChannelState)
                                  ? SizedBox(
                                      child: LoadingSkeletonText(),
                                    )
                                  : (state is LoadedEditChannelState)
                                      ? Text(
                                          state.channel.Subscribers.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        )
                                      : Text("impossible"))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        BlocBuilder<EditChannelBloc, EditChannelState>(
          builder: (context, state) {
            if (state is LoadedEditChannelState) {
              List<Podcast>? podcasts = state.channel.Podcasts;
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return RecentlyUploadedPodcast(
                      podcast: podcasts![index], channel: state.channel);
                },
                childCount: podcasts!.length,
              ));
            } else {
              return SliverToBoxAdapter(child: Flexible(child: LoadingList()));
            }
          },
        )
      ],
    );
  }
}
