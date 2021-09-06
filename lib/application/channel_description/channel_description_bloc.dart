import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/repository/Ichannel_repository.dart';

part 'channel_description_event.dart';
part 'channel_description_state.dart';

class ChannelDescriptionBloc
    extends Bloc<ChannelDescriptionEvent, ChannelDescriptionState> {
  IChannelRepository channelRepository;
  late Channel channel;
  late bool isSubscribed;

  ChannelDescriptionBloc({required this.channelRepository})
      : super(LoadingChannelDescriptionState());

  @override
  Stream<ChannelDescriptionState> mapEventToState(
      ChannelDescriptionEvent event) async* {
    if (event is SubscriptionEvent) {
      yield LoadingChannelDescriptionState();
      Future.delayed(Duration(seconds: 1), () {
        print("Sending request to the internet");
      });
      channelRepository.setSubscription(event.channelId, event.isSubscribing);
      yield InitialChannelDescriptionState(channel, event.isSubscribing);
    } else if (event is LoadInitialEvent) {
      channel = event.channel;
      isSubscribed = await channelRepository.isSubscribed(channel.Id);

      yield LoadingChannelDescriptionState();
      await Future.delayed(Duration(seconds: 3), () {});
      yield InitialChannelDescriptionState(channel, isSubscribed);
    }
  }
}
