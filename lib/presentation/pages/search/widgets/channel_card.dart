import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_route/auto_route.dart';

import 'package:podcast_app/application/channel_description/channel_description_bloc.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

import '../constants.dart';

class ChannelCard extends StatelessWidget {
  final Channel channel;

  const ChannelCard({Key? key, required this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final channelBloc = BlocProvider.of<ChannelDescriptionBloc>(context);

    return InkWell(
      onTap: () {
        channelBloc.add(LoadInitialEvent(channel: channel));
        context.router.push(ChannelDetailRoute());
      },
      child: Card(
        color: HexColor("#282828"),
        child: Container(
          margin: EdgeInsets.only(top: 8.0),
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(channel.ImageUrl),
                              fit: BoxFit.cover,
                            )),
                        width: 75,
                        height: 65,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${channel.Name}",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "${channel.Name}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "${channel.Description}",
                  style: TextStyle(color: Color(0xffb3b3b3), fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
