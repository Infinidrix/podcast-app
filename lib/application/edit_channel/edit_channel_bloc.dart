import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/repository/edit_channel/IEditChannelRepositoy.dart';

import 'edit_channel_event.dart';
import 'edit_channel_state.dart';

class EditChannelBloc extends Bloc<EditChannelEvent, EditChannelState> {
  IEditChannelRepository editChannelRepository;
  EditChannelBloc({
    required this.editChannelRepository,
  }) : super(LoadingEditChannelState());

  @override
  Stream<EditChannelState> mapEventToState(EditChannelEvent event) async* {
    if (event is LoadIntialEditChannelEvent) {
      yield LoadingEditChannelState();
      await Future.delayed(Duration(seconds: 3));
      yield LoadedEditChannelState(channel: event.channel);
    }
  }
}
