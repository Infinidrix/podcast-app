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
      // TODO: Change this asap
      // final userId = "1";
      final userId = LoginProvider.SESSION.getString("userId")!;
      print("this doesn't make sense");
      if (event is SubscriptionEvent) {
        yield LoadingChannelDescriptionState();
        channelRepository.setSubscription(
            userId, channel.id, event.isSubscribing);
        yield InitialChannelDescriptionState(channel, event.isSubscribing);
      } else if (event is LoadInitialEvent) {
        print("we arenot ");
        channel = event.channel;
        print(channel.id);
        yield LoadingChannelDescriptionState();
        channel = await channelRepository.getChannel(channel.id);
        isSubscribed = await channelRepository.isSubscribed(userId, channel.id);

        yield InitialChannelDescriptionState(channel, isSubscribed);
      }
    } catch (e) {
      print(e);
      yield FailedChannelDescriptionState(e.toString(), channel);
    }
  }
}
