import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(InitialBottomNavigationState());

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    // TODO: Add your event logic
    var roles = jsonEncode(await LoginProvider.SESSION.getString("roles"));
    print("roles roles roles \n\n\n ${roles}");
    if (roles.contains("Creator")) {
      yield UserNavigationState();
    } else {
      yield CreatorNavigationState();
    }
    if (event is CheckRoleEvent) {
      roles = jsonEncode(await LoginProvider.SESSION.getString("roles"));
      print(roles);
      print("roles if roles roles \n\n\n $roles[0]");

      if (roles.contains("Creator")) {
        yield UserNavigationState();
      } else {
        yield CreatorNavigationState();
      }
    }
  }
}
