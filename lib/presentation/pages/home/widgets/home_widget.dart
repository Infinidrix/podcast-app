import 'package:auto_route/auto_route.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class TopPicks extends StatelessWidget {
  final String name;
  final String img;

  const TopPicks({
    Key? key,
    required this.name,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ChannelDetailRoute());
      },
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: 190,
          decoration: BoxDecoration(
            color: HexColor("#262626"),
            borderRadius: BorderRadius.circular(7.0),
          ),
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              FlutterLogo(
                size: 45,
              ),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}

class AudioWithThumbnail extends StatelessWidget {
  final String imgStr;
  final String audioName;

  const AudioWithThumbnail(
      {Key? key, required this.imgStr, required this.audioName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white54,
      onTap: () {
        context.router.push(ChannelDetailRoute());
      },
      child: SizedBox(
        height: 175,
        width: 175,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    imgStr,
                    height: 175,
                    width: 175,
                  ),
                  Text("$audioName",
                      style: TextStyle(
                        fontSize: 18.0,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget topPickCategory = Container(
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
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
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
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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

    return Scaffold(
      body: SafeArea(
        child: topPickCategory,
      ),
    );
  }
}
