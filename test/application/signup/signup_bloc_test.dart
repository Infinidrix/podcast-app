import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:podcast_app/application/sign_in/sign_in_bloc.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:podcast_app/repository/login_repository.dart';

import 'signup_bloc_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  late SignInBloc bloc;
  MockLoginRepository mockLoginRepository = MockLoginRepository();

  void setUp() {
    bloc = SignInBloc();
  }
}
