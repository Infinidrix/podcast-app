// import 'dart:html';

import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:podcast_app/application/create_podcast/create_podcast_application.dart';
import 'package:podcast_app/models/Podcast.dart';
import 'package:podcast_app/repository/ChannelRepository.dart';
import 'package:mockito/mockito.dart';
import 'package:podcast_app/repository/CreatePodcastRepository.dart';

import 'create_pdcast_test.mocks.dart';

// part 'create_pdcast_test.mock.dart';

@GenerateMocks([CreatePodcastRepository])
void main() {
  late CreatePodcastBloc bloc;
  MockCreatePodcastRepository mockCreatePodcastRepository =
      MockCreatePodcastRepository();
// final state = CreatePodcastState();
  void setUp() {
    bloc = CreatePodcastBloc(
        CreatePodcastInitialState(), mockCreatePodcastRepository);
  }

  test("intial the state should be empty", () {
    setUp();
    expect(bloc.state, CreatePodcastInitialState());
  });
  group("CreatePodcastBloc", () {
    // XFile? image = null;
    blocTest('emits [RecordState] when RecordEvent is added.',
        build: () {
          setUp();
          return bloc;
        },
        act: (CreatePodcastBloc bloc) => bloc.add(RecordEvent()),
        expect: () {
          return [RecordState()];
        });
    String j = "some";
    blocTest('emits [FilePickingError] when RecordedEvent is added.',
        build: () {
          setUp();
          return bloc;
        },
        act: (CreatePodcastBloc bloc) => bloc.add(RecordedEvent(j)),
        expect: () {
          return [isA<FilePicked>()];
        });
    blocTest('emits [FilePicked] when FilePickEvent is added.',
        build: () {
          setUp();
          return bloc;
        },
        act: (CreatePodcastBloc bloc) => bloc.add(FilePickEvent()),
        expect: () {
          return [isA<FilePicked>()];
        });
    // dynamic f = File(j);
    blocTest('emits [Saving] when SaveEvent is added.',
        build: () {
          setUp();
          when(mockCreatePodcastRepository.savePodcast(File(j), "podcast title",
                  "description", "channelId", "userId"))
              .thenAnswer((realInvocation) => Future.value(true));
          return bloc;
        },
        act: (CreatePodcastBloc bloc) => bloc.add(SaveEvent(
          file: File(j),podcastTitle: "podcast title",podcastDescription: "description",channelId: "channelId"
        )),
        expect: () {
          return [Saving()];
        });
  });
}
