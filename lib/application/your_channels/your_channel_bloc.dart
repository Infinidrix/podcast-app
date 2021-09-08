import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/your_channels/your_channel_event.dart';
import 'package:podcast_app/application/your_channels/your_channel_state.dart';

import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/repository/your_channel_repository/IYourChannelRepository.dart';

class YourChannelBloc extends Bloc<YourChannelEvent, YourChannelState> {
  final IYourChannelRepository repository;

  YourChannelBloc({required this.repository}) : super(LoadingYourChannel());

  @override
  Stream<YourChannelState> mapEventToState(YourChannelEvent event) async* {
    List<Channel> channels;
    if (event is IntialYourChannelEvent) {
      print("INTIAL YOUR CHANNEL");
      yield LoadingYourChannel();
      channels = await repository.getMyChannels();
      yield LoadedYourChannel(channels);
    }
  }
}
