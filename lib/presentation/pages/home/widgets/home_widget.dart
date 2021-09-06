import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/home/home_bloc.dart';
import 'package:podcast_app/presentation/pages/home/widgets/audio_card.dart';
import 'package:podcast_app/presentation/pages/home/widgets/top_picks.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is NavigateToProfileHomeState) {
          context.router.replace(EditProfileRoute(user: state.user));
        }
      },
      builder: (context, state) {
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
                    child: GestureDetector(
                      onTap: () {
                        homeBloc.add(ProfileButtonPressedEvent());
                      },
                      child: Icon(Icons.settings_outlined),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Picks",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                        name: "Dance & EDM",
                        img: "img.png",
                      ),
                      TopPicks(
                        name: "Dance & EDM",
                        img: "img.png",
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopPicks(
                        name: "Dance & EDM",
                        img: "img.png",
                      ),
                      TopPicks(
                        name: "Dance & EDM",
                        img: "img.png",
                      )
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
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int item) {
                        return AudioWithThumbnail(
                          imgStr: "assets/images/welcome.png",
                          audioName: "Lex Fridman",
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
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int item) {
                        return AudioWithThumbnail(
                          imgStr: "assets/images/welcome.png",
                          audioName: "Lex Fridman",
                        );
                      }),
                )
              ],
            ));
      },
    );
  }
}
