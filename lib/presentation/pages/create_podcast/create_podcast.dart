import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_bloc.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_state.dart';
import 'package:podcast_app/presentation/pages/create_podcast/widgets/create_podcast_widget.dart';
import 'package:podcast_app/repository/CreatePodcastRepository.dart';

class CreatePodcastPage extends StatefulWidget {
  CreatePodcastPage({Key? key}) : super(key: key);

  @override
  _CreatePodcastPageState createState() => _CreatePodcastPageState();
}

class _CreatePodcastPageState extends State<CreatePodcastPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CreatePodcastBloc(InitialState(), CreatePodcastRepository()),
        )
      ],
      child: CreatePodcastWidget(),
    );
  }
}
