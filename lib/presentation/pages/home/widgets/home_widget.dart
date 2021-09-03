import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/application/home_page/home_page_state.dart';
import 'package:podcast_app/presentation/pages/home/widgets/top_picks.dart';

import 'package:podcast_app/presentation/pages/home/widgets/audio_card.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageBloc = BlocProvider.of<HomePageBloc>(context);

    return BlocBuilder<HomePageBloc, HomePageState>(
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

          return Container(
              color: HexColor("#121212"),
              padding: EdgeInsets.only(
                left: 4.0,
                top: 4.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.settings_outlined),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Top Picks",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TopPicks(
                            name: topPicks[0].Name,
                            img: topPicks[0].ImageUrl,
                            channelId: topPicks[2].Id),
                        TopPicks(
                            name: topPicks[1].Name,
                            img: topPicks[1].ImageUrl,
                            channelId: topPicks[2].Id)
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TopPicks(
                          name: topPicks[2].Name,
                          img: topPicks[2].ImageUrl,
                          channelId: topPicks[2].Id,
                        ),
                        TopPicks(
                            name: topPicks[3].Name,
                            img: topPicks[3].ImageUrl,
                            channelId: topPicks[2].Id)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Recently Played",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recently.length,
                        itemBuilder: (BuildContext context, int item) {
                          return AudioWithThumbnail(
                            imgStr: "assets/images/welcome.png",
                            audioName: recently[item].Name,
                          );
                        }),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Trending",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: trending.length,
                        itemBuilder: (BuildContext context, int item) {
                          return AudioWithThumbnail(
                            imgStr: "assets/images/welcome.png",
                            audioName: trending[item].Name,
                          );
                        }),
                  )
                ],
              ));
        }

        return Container();
      },
    );
  }
}
