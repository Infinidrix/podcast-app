import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:podcast_app/application/create_channel/create_channel_bloc.dart';
import 'package:podcast_app/application/create_channel/create_channel_event.dart';
import 'package:podcast_app/application/create_channel/create_channel_state.dart';
import 'package:podcast_app/repository/ChannelRepository.dart';
import 'package:mockito/mockito.dart';

import 'create_channel_test.mocks.dart';

// part 'create_channel_test.mock.dart';
@GenerateMocks([ChannelRepository])
void main() {
  late CreateChannelBloc bloc;
  MockChannelRepository mockLoginRepository = MockChannelRepository();

  void setUp() {
    bloc = CreateChannelBloc(channelRepository: mockLoginRepository);
  }

  test("intial the state should be empty", () {
    setUp();
    expect(bloc.state, CreateChannelInitialState());
  });
  group("CreateCHannelBloc", () {
    // final user = LoginDtoModel(
    //   Token: "Token",
    //   user: User(
    //       FullName: "FullName",
    //       Email: "Email",
    //       UserName: "UserName",
    //       ProfilePicturePath: "ProfilePicturePath",
    //       Id: "Id"),
    //   expiration: "expiration",
    // );
    XFile? image = null;
    blocTest(
        'emits [OnImageUploadedState] when ChangeImageButtonPressedEvent is added.',
        build: () {
          setUp();
          return bloc;
        },
        act: (CreateChannelBloc bloc) =>
            bloc.add(ChangeImageButtonPressedEvent(image: image)),
        expect: () {
          return [OnImageUploadedState(image: image)];
        });

    blocTest(
        'emits [CreateChannelLoadingState] when CreateChannelSaveEvent is added.',
        build: () {
          setUp();
          return bloc;
        },
        act: (CreateChannelBloc bloc) => bloc.add(CreateChannelSaveEvent(
            Name: "name", Description: "description", ImageURL: image)),
        expect: () {
          return [CreateChannelLoadingState()];
        });
  });
}
