import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
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
    try {
      final userId = LoginProvider.SESSION.getString("userId")!;
      if (event is SubscriptionEvent) {
        yield LoadingChannelDescriptionState();
        channelRepository.setSubscription(
            userId, channel.Id, event.isSubscribing);
        yield InitialChannelDescriptionState(channel, event.isSubscribing);
      } else if (event is LoadInitialEvent) {
        yield LoadingChannelDescriptionState();
        channel = event.channel;
        channel = await channelRepository.getChannel(channel.Id);
        isSubscribed = await channelRepository.isSubscribed(userId, channel.Id);

        yield InitialChannelDescriptionState(channel, isSubscribed);
      }
    } catch (e) {
      print(e);
      yield FailedChannelDescriptionState(e.toString(), channel);
    }
  }
}
