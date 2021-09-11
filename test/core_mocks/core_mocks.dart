import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcast_app/application/home_page/home_page_bloc.dart';
import 'package:podcast_app/application/home_page/home_page_event.dart';
import 'package:podcast_app/application/home_page/home_page_state.dart';
import 'package:podcast_app/application/login/login_bloc.dart';


class MockHomepageBloc extends MockBloc<HomePageEvent, HomePageState>
    implements HomePageBloc {}

class HomepageStateFake extends Fake implements HomePageState {}

class HomepageEventFake extends Fake implements HomePageEvent {}