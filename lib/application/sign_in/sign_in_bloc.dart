import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_events.dart';
import 'sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, LoginState>{
  SignInBloc() : super(InitialState());

  @override
  Stream<LoginState> mapEventToState(SignInEvent event) async* {
    if (event is LoginEvent){
      print(event.email + " " + event.password);
      yield LoginLoading();
      await Future.delayed(Duration(seconds: 1), (){});
      if (event.email == "" && event.password == ""){
        yield LoginSuccess();
      }
      else {
        yield LoginFailed("Wrong credentials");
        await Future.delayed(Duration(seconds: 3), (){});
        yield InitialState();
      }
    }
  }
  
} 