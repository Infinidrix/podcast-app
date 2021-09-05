import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/create_channel/create_channel_event.dart';
import 'package:podcast_app/application/create_channel/create_channel_state.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/repository/Ichannel_repository.dart';

class CreateChannelBloc extends Bloc<CreateChannelEvent, CreateChannelState> {
  IChannelRepository channelRepository;

  CreateChannelBloc({required this.channelRepository})
      : super(CreateChannelInitialState());

  final Map channel = {
    'Name': "abdi",
    'Description': "blblabla",
    'Image': "a/gmail/com"
  };

  @override
  Stream<CreateChannelState> mapEventToState(CreateChannelEvent event) async* {
    if (event is CreateChannelSaveEvent) {
      yield CreateChannelLoadingState();
      // await Future.delayed(Duration(seconds: 4));
      // if (channel["Name"] == event.Name.trim() &&
      //     channel['Description'] == event.Description.trim() &&
      //     channel['Image'] == event.ImageURL.trim()) {
      //   print('success in creating channel');
      //         yield CreateChannelSuccessState();
      // } else {
      //   yield CreateChannelFailedState(ErrorMessage: "Failed to create a channel!");
      // }
      final ChannelOrError = await channelRepository.createChannel(
          Name: event.Name,
          Description: event.Description,
          ImageURL: event.ImageURL);
      yield* ChannelOrError.fold((ErrorMessage) async* {
        yield CreateChannelFailedState(ErrorMessage: ErrorMessage);
      }, (channel) async* {
        yield CreateChannelSuccessState();
      });
    }
  }
}
