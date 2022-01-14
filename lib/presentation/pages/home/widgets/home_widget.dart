import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/application/home_page/home_page_state.dart';
import 'package:podcast_app/presentation/pages/home/widgets/audio_card.dart';
import 'package:podcast_app/presentation/pages/home/widgets/top_picks.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageBloc = BlocProvider.of<HomePageBloc>(context);

    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state is NavigateToProfileHomeState) {
          print("REDIRECTING TO EDIT");
          context.router.push(EditProfileRoute(user: state.user));
        }
      },
      builder: (context, homePageState) {
        if (homePageState is LoadingHomePageState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (homePageState is LoadedHomePageState) {
          var trending = homePageState.trending;
          var recently = homePageState.recentlyPlayed;
          var topPicks = homePageState.topPicks;
          print("The TOPPEST picks ${topPicks[0].id}");
          return RefreshIndicator(
            onRefresh: () async {
              homePageBloc.add(LoadIntialHomeEvent());
            },
            child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Container(
                          color: HexColor("#121212"),
                          padding: EdgeInsets.only(
                            left: 4.0,
                            top: 4.0,
                          ),
                          child: Container(
                            // height: 750,
                            child: Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: Icon(Icons.settings_outlined),
                                        onPressed: () {
                                          homePageBloc
                                              .add(ProfileButtonPressedEvent());
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Top Picks",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 150.0,
                                    child: GridView.count(
                                      childAspectRatio: 0.47,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 4.0,
                                      mainAxisSpacing: 2.0,
                                      scrollDirection: Axis.horizontal,
                                      children: homePageState.topPicks
                                          .map((channel) =>
                                              TopPicks(channel: channel))
                                          .toList(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Recently Played",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 175,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: recently.length,
                                        itemBuilder:
                                            (BuildContext context, int item) {
                                          return AudioWithThumbnail(
                                            podcast: recently[item],
                                          );
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Trending",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 170,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: trending.length,
                                        itemBuilder:
                                            (BuildContext context, int item) {
                                          return AudioWithThumbnail(
                                            podcast: trending[item],
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ]),
          );
        }
        if (homePageState is FailedHomePageState) {
          return RefreshIndicator(
            onRefresh: () async {
              homePageBloc.add(LoadIntialHomeEvent());
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      Center(
                          child: Text("${homePageState.errorMessage}",
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.grey))),
                      Center(child: Text("Drag Down to try again")),
                    ]),
              ),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            homePageBloc.add(LoadIntialHomeEvent());
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Center(
                        child: Text("Drag Down to see changes",
                            style: TextStyle(fontSize: 16.0)))
                  ]),
            ),
          ),
        );
      },
    );
  }
}
