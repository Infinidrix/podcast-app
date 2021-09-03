import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/create_channel/create_channel_event.dart';
import 'package:podcast_app/application/create_channel/create_channel_state.dart';
import 'package:podcast_app/repository/Ichannel_repository.dart';

class CreateChannelBloc extends Bloc<CreateChannelEvent, CreateChannelState>{
  IChannelRepository channelRepository;

  CreateChannelBloc({required this.channelRepository})
      : super(CreateChannelInitialState());

      @override
  Stream<CreateChannelState> mapEventToState(CreateChannelEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
