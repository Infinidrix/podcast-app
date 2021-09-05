import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/repository/ilogin_repository.dart';

part 'wellcome_event.dart';
part 'wellcome_state.dart';

class WellcomeBloc extends Bloc<WellcomeEvent, WellcomeState> {
  final ILoginRepository loginRepository;
  WellcomeBloc({required this.loginRepository}) : super(InitialWellcomeState());

  @override
  Stream<WellcomeState> mapEventToState(WellcomeEvent event) async* {
    // TODO: Add your event logic

    final userCredOrNot = await loginRepository.getPersistedUserCredOrNot();
    print('userCrdOrNot in login bloc ${userCredOrNot}');
    print(userCredOrNot.isRight());

    yield* userCredOrNot.fold((l) async* {}, (userCred) async* {
      print('dont now what ${userCred.Password}');
      yield HaveUserCredWellcomeState();
      yield InitialWellcomeState();
    });
  }
}
