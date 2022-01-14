import 'dart:collection';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:podcast_app/application/audio_player/audio_player_bloc.dart';
import 'package:podcast_app/application/audio_player/audio_player_events.dart';
import 'package:podcast_app/application/channel_description/channel_description_bloc.dart';
import 'package:podcast_app/data_provider/constants.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/presentation/core/loading_list_widget.dart';
import 'package:podcast_app/presentation/pages/library_download_subscribe_pages/LibDownSubTabMenuPage.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class ChannelDetailWidget extends StatelessWidget {
  Widget _getSubscribeButton(
      ChannelDescriptionState state, ChannelDescriptionBloc channelBloc) {
    Text textWidget;
    if (state is InitialChannelDescriptionState) {
      textWidget =
          (state.isSubscribed) ? Text("Unsubscribe") : Text("Subscribe");
    } else {
      textWidget = Text("Loading");
    }
    return ElevatedButton(
      onPressed: () {
        if (state is InitialChannelDescriptionState) {
          channelBloc.add(SubscriptionEvent(!state.isSubscribed, "channelId"));
        } else {}
      },
      child: textWidget,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final channelBloc = BlocProvider.of<ChannelDescriptionBloc>(context);
    final audioBloc = BlocProvider.of<AudioPlayerBloc>(context);
    return BlocBuilder<ChannelDescriptionBloc, ChannelDescriptionState>(
      builder: (_, channelState) {
        return Container(
            color: Colors.black,
            child: RefreshIndicator(
              onRefresh: () async {
                if (channelState is InitialChannelDescriptionState) {
                  channelBloc
                      .add(LoadInitialEvent(channel: channelBloc.channel));
                } else if (channelState is FailedChannelDescriptionState) {
                  channelBloc
                      .add(LoadInitialEvent(channel: channelState.channel));
                }
              },
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    leading: IconButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    pinned: true,
                    snap: false,
                    floating: false,
                    expandedHeight: 300.0,
                    flexibleSpace: FlexibleSpaceBar(
                        title: (channelState is LoadingChannelDescriptionState)
                            ? SizedBox(
                                child: SkeletonAnimation(
                                  borderRadius: BorderRadius.circular(10.0),
                                  shimmerColor:
                                      2 % 2 != 0 ? Colors.grey : Colors.white54,
                                  child: Container(
                                    height: 15,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: HexColor('#202020')),
                                  ),
                                ),
                              )
                            : (channelState is InitialChannelDescriptionState)
                                ? Text(
                                    "${channelState.channel.name}",
                                  )
                                : Text("Error Try Again"),
                        background: FlutterLogo(),
                        stretchModes: [
                          StretchMode.zoomBackground,
                          StretchMode.fadeTitle
                        ],
                        collapseMode: CollapseMode.parallax),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 5.0, bottom: 5.0),
                                        child: (channelState
                                                is LoadingChannelDescriptionState)
                                            ? SizedBox(
                                                child: SizedBox(
                                                child: SkeletonAnimation(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  shimmerColor: 2 % 2 != 0
                                                      ? Colors.grey
                                                      : Colors.white54,
                                                  child: Container(
                                                    height: 15,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color: HexColor(
                                                            '#202020')),
                                                  ),
                                                ),
                                              ))
                                            : (channelState
                                                    is InitialChannelDescriptionState)
                                                ? Text(
                                                    "${channelState.channel.subscriber} subscribers",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.grey),
                                                  )
                                                : Text("Error"),
                                      ),
                                      _getSubscribeButton(
                                          channelState, channelBloc),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) async {
                                          // final user = json.decode(LoginProvider
                                          //         .SESSION
                                          //         .getString("user")!)
                                          //     as Map<String, dynamic>;
                                          // String token =
                                          //     user["token"]['access'];
                                          // // TODO: Change this to actual user id
                                          // print("Got here ${channelState}");
                                          // // final http.Client httpClient;
                                          // // TODO: Change this as soon as possible
                                          // // id = 'da9c196a-ac2b-4a5d-9dfd-13adce101194';
                                          String channel_id =
                                              channelBloc.channel.id;
                                          print(channel_id);

                                          // final ratingg = await http.Client().get(
                                          //     Uri.parse(
                                          //         "http://$URL/api/v1/ratings/$channel_id/$user_id/"),
                                          //     headers: {
                                          //       'Authorization':
                                          //           'Bearer ${token}',
                                          //     }).timeout(Duration(seconds: 7));
                                          // print(ratingg.body);
                                          String? userId = LoginProvider.SESSION
                                              .getString('userId');
                                          final user = json.decode(LoginProvider
                                                  .SESSION
                                                  .getString("user")!)
                                              as Map<String, dynamic>;
                                          print(userId);
                                          int user_id = user["data"]['id'];

                                          String token = user["token"]['access']
                                              .toString();
                                          var request = http.MultipartRequest(
                                            'POST',
                                            Uri.parse(
                                                'http://$URL/api/v1/ratings/'),
                                          )..fields.addAll({
                                              "channel_id": channel_id,
                                              "rating": rating.toString(),
                                              "user_id":
                                                  "1" //TODO: Remove this hardcoding if possible
                                            });
                                          print("THIS HAS HAPPENED");

                                          request.headers.addAll({
                                            'Authorization': 'Bearer ${token}',
                                          });
                                          StreamedResponse? response;
                                          try {
                                            response = await request.send();
                                          } catch (e) {
                                            return null;
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (channelState
                                      is InitialChannelDescriptionState) {
                                    audioBloc.add(InitializePlayerEvent(
                                        podcasts: ListQueue.from(
                                            channelState.channel.podcasts!)));
                                    context.router.push(PlayerRoute());
                                  }
                                },
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  shape: MaterialStateProperty.all(
                                    CircleBorder(),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      Size.fromRadius(24.0)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      child: Text(
                        "Podcasts",
                        style: TextStyle(fontSize: 21),
                      ),
                    ),
                  ),
                  BlocBuilder<ChannelDescriptionBloc, ChannelDescriptionState>(
                      builder: (_, state) {
                    if (state is FailedChannelDescriptionState) {
                      return SliverFixedExtentList(
                          itemExtent: 90.0,
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Text(
                                  "${state.errorMessage}: \nDrag Down to refresh");
                            },
                            childCount: 1,
                          ));
                    } else if (state is InitialChannelDescriptionState) {
                      var listOfPodcasts = state.channel.podcasts;
                      print("we are ");
                      print(listOfPodcasts);
                      return SliverFixedExtentList(
                        itemExtent: 90.0,
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  audioBloc.add(InitializePlayerEvent(
                                      podcasts: ListQueue.from(
                                          [listOfPodcasts![index]])));

                                  context.router.push(PlayerRoute());
                                },
                                child: Card(
                                    color: Colors.black,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text("$index"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 17.0),
                                          child: FlutterLogo(
                                            size: 35.0,
                                          ),
                                        ),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${listOfPodcasts![index].name}",
                                              style: TextStyle(fontSize: 19.0),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 4.0)),
                                            Text(
                                              "${listOfPodcasts[index].numberOfListeners}",
                                              style: TextStyle(
                                                  fontSize: 10.0,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        )),
                                        PopupMenuButton(
                                          itemBuilder: (c) =>
                                              <PopupMenuEntry<Object?>>[],
                                        )
                                      ],
                                    )));
                          },
                          childCount: listOfPodcasts!.length,
                        ),
                      );
                    }
                    return SliverToBoxAdapter(
                        child: Flexible(child: LoadingList()));
                  })
                ],
              ),
            ));
      },
    );
  }
}
