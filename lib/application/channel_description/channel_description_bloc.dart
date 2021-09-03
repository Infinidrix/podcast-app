import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/models/Channel.dart';
import 'package:podcast_app/repository/Ichannel_repository.dart';

part 'channel_description_event.dart';
part 'channel_description_state.dart';

class ChannelDescriptionBloc
    extends Bloc<ChannelDescriptionEvent, ChannelDescriptionState> {
  IChannelRepository channelRepository;

  ChannelDescriptionBloc({required this.channelRepository})
      : super(LoadingChannelDescriptionState());

  @override
  Stream<ChannelDescriptionState> mapEventToState(
      ChannelDescriptionEvent event) async* {
    // TODO: Add your event logic
    final channel = await channelRepository.getChannel("channelId");
    final isSubscribed = await channelRepository.isSubscribed("channelId");
    if (event is SubscriptionEvent) {
      yield LoadingChannelDescriptionState();
      Future.delayed(Duration(seconds: 1), () {
        print("Sending request to the internet");
      });
      channelRepository.setSubscription(event.channelId, event.isSubscribing);
      yield InitialChannelDescriptionState(channel, event.isSubscribing);
    } else if (event is LoadInitialEvent) {
      yield LoadingChannelDescriptionState();
      await Future.delayed(Duration(seconds: 3), () {});
      yield InitialChannelDescriptionState(channel, isSubscribed);
    }
  }
}
