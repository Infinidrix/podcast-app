import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/data_provider/Ichannel_provider.dart';

import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/repository/Ichannel_repository.dart';
import 'package:podcast_app/repository/edit_channel/IEditChannelRepositoy.dart';

import 'edit_channel_event.dart';
import 'edit_channel_state.dart';

class EditChannelBloc extends Bloc<EditChannelEvent, EditChannelState> {
  IEditChannelRepository editChannelRepository;
  IChannelRepository channelRepository;
  EditChannelBloc({
    required this.editChannelRepository,
    required this.channelRepository,
  }) : super(LoadingEditChannelState());

  @override
  Stream<EditChannelState> mapEventToState(EditChannelEvent event) async* {
    if (event is LoadIntialEditChannelEvent) {
      yield LoadingEditChannelState();
      // TODO: fixbug
      // event.channel = await channelRepository.getChannel(event.channel.id);
      yield LoadedEditChannelState(channel: event.channel);
    }
    // Edit Podcast Event
    else if (event is EditPodcastEvent) {
      yield LoadingEditChannelState();
      // TODO
      // final channel = await editChannelRepository.getChannel(event.channel.id);

      Either<String, Channel> res =
          await editChannelRepository.editPodcast(event.podcast, event.channel);

      yield* res.fold((l) async* {
        print("folding 1");
        yield ErrorEditChannelState(error: l);
        print("folding 2");
        yield LoadedEditChannelState(channel: event.channel);
        print("folding 3");
      }, (r) async* {
        print("REFT");
        yield LoadedEditChannelState(channel: r);
      });
      // yield LoadedEditChannelState(channel: event.channel);
    }

    // Delete Podcast Event
    else if (event is DeletePodcastEvent) {
      yield LoadingEditChannelState();

      var res = await editChannelRepository.deletePodcast(
          event.podcast, event.channel);
      // var channel = await editChannelRepository.getChannel(event.channel.id);

      yield* res.fold((l) async* {
        print("FOLDING?");
        yield ErrorEditChannelState(error: l);
        yield LoadedEditChannelState(channel: event.channel);
        print("FOLDING?");
      }, (r) async* {
        yield LoadedEditChannelState(channel: r);
      });

      // final channel = await editChannelRepository.getChannel(event.channel.id);

    }
  }
}
