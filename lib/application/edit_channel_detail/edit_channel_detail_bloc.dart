import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/edit_channel_detail/edit_channel_detail_event.dart';
import 'package:podcast_app/application/edit_channel_detail/edit_channel_detail_state.dart';
import 'package:podcast_app/repository/Ichannel_repository.dart';

class EditChannelDetailBloc
    extends Bloc<EditChannelDetailEvent, EditChannelDetailState> {
  IChannelRepository channelRepository;
  EditChannelDetailBloc({required this.channelRepository})
      : super(EditChannelDetailInitialState());

  @override
  Stream<EditChannelDetailState> mapEventToState(
      EditChannelDetailEvent event) async* {
    if (event is EditChannelChangeImageButtonPressedEvent) {
      yield EditChannelDetailImageUploadedState(Image: event.Image);
    } else if (event is EditChannelDetailSaveEvent) {
      yield EditChannelDetailLoadingState();

      try {
        final ChannelOrError = await channelRepository.editChannel(
            Name: event.Name,
            Description: event.Description,
            ImageURL: event.Image,
            ChannelID: event.ChannelID);
      } catch (e) {
        print("object");
      }
    }
  }
}
