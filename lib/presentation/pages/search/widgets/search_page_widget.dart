import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/search/search_bloc.dart';
import 'package:podcast_app/application/search/search_event.dart';
import 'package:podcast_app/application/search/search_state.dart';
import 'package:podcast_app/presentation/pages/library_download_subscribe_pages/Library/Widgets/LibraryCard.dart';
import 'package:podcast_app/presentation/pages/search/widgets/channel_card.dart';
import 'package:podcast_app/presentation/pages/search/widgets/custom_text.dart';
import 'package:podcast_app/presentation/pages/search/widgets/recently_searched_channel.dart';
import 'package:podcast_app/presentation/pages/search/widgets/recently_searched_widget.dart';

import '../constants.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    return Container(
      padding: EdgeInsets.all(10),
      color: HexColor("#121212"),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Search",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 65,
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: searchInputDecoration,
              controller: searchText,
              onChanged: (String search) {
                searchBloc.add(SearchingEvent(
                  search: search,
                ));
              },
            ),
          ),
          BlocConsumer<SearchBloc, SearchState>(listener: (context, state) {
            if (state is SearchError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                duration: Duration(milliseconds: 2600),
              ));
            }
          }, builder: (context, state) {
            if (state is SearchLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is LoadRecentlySearchedState) {
              final podcast = state.recentlySearchedPodcast;
              final channels = state.recentlySearchedChannel;

              return Expanded(
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(text: "Recenty Searched")),
                  TabBar(
                    tabs: [Tab(text: "Podcast"), Tab(text: "Channel")],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: TabBarView(controller: _tabController, children: [
                      ListView.builder(
                          itemCount: podcast.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, count) {
                            return Expanded(
                              child: Column(
                                children: [
                                  Recently(
                                    podcast: podcast[count],
                                  ),
                                ],
                              ),
                            );
                          }),
                      ListView.builder(
                          itemCount: channels.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, count) {
                            return Expanded(
                              child: Column(
                                children: [
                                  RecentlyChannel(channel: channels[count]),
                                ],
                              ),
                            );
                          }),
                    ]),
                  ),
                ]),
              );
            }
            if (state is SearchResult) {
              final channels = state.channelResult;
              final podcasts = state.podcastResult;
              return Expanded(
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(text: "Search Result")),
                  TabBar(
                    tabs: [Tab(text: "Podcast"), Tab(text: "Channel")],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: TabBarView(controller: _tabController, children: [
                      ListView.builder(
                          itemCount: podcasts.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, count) {
                            return LibraryCard(
                              podcast: podcasts[count],
                            );
                          }),
                      ListView.builder(
                          itemCount: channels.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, count) {
                            return ChannelCard(
                              channel: channels[count],
                            );
                          }),
                    ]),
                  ),
                ]),
              );
            }

            return Container();
          }),
        ],
      ),
    );
  }
}

// Widget searchInput = Container(
//   height: 65,
//   padding: EdgeInsets.only(top: 20),
//   margin: EdgeInsets.only(bottom: 15),
//   child: TextFormField(
//     style: TextStyle(color: Colors.white),
//     decoration: searchInputDecoration,
//     controller: searchText,
//     onChanged: (String search) {
//       searchBloc.add(SearchingEvent(
//         search: search,
//       ));
//     },
//   ),
// );
