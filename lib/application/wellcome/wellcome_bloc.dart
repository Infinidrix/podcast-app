import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/repository/ilogin_repository.dart';

part 'wellcome_event.dart';
part 'wellcome_state.dart';

class WellcomeBloc extends Bloc<WellcomeEvent, WellcomeState> {
  final ILoginRepository loginRepository;
  WellcomeBloc({required this.loginRepository}) : super(InitialWellcomeState());

  @override
  Stream<WellcomeState> mapEventToState(WellcomeEvent event) async* {
    // TODO: Add your event logic
    //
    // if (event is HaveCredLocalWellcomeEvent) {
    //   final userCredOrNot = await loginRepository.getPersistedUserCredOrNot();
    //   print('userCrdOrNot in login bloc ${userCredOrNot}');
    //   print(userCredOrNot.isRight());
    //
    //   yield* userCredOrNot.fold((l) async* {}, (userCred) async* {
    //     print('dont now what ${userCred.Password}');
    //     yield HaveUserCredWellcomeState();
    //   });
    // }
    // await LoginProvider.SESSION.clear();
    // await LoginProvider.SESSION.deleteItem("userCred");
    // await LoginProvider.SESSION.setItem("userCred", "value");
    await LoginProvider.getSharedPrefernce();
    // await LoginProvider.SESSION.remove("userCred");

    var userCredOrNot = await LoginProvider.SESSION.getString("userCred");

    await Future.delayed(Duration(seconds: 2));
    userCredOrNot = await LoginProvider.SESSION.getString("userCred");

    print('userCrdOrNot in wellcome bloc ${userCredOrNot}');
    if (userCredOrNot != null && userCredOrNot != "value") {
      yield HaveUserCredWellcomeState();
    } else {
      userCredOrNot = await LoginProvider.SESSION.getString("userCred");
      yield InitialWellcomeState();
      yield UserCredNotAvilableWellcomState();
      userCredOrNot = await LoginProvider.SESSION.getString("userCred");
    }

    // print(userCredOrNot.isRight());

    // yield* userCredOrNot.fold((l) async* {}, (userCred) async* {
    //   print('dont now what ${userCred.Password}');
    //   yield HaveUserCredWellcomeState();
    // });
  }
}
