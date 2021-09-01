import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/sign_in/sign_in_bloc.dart';
import 'package:podcast_app/presentation/pages/signin/widgets/signin_page_widget.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => SignInBloc() , 
      child: SigninWidget()
    );
  }
}
