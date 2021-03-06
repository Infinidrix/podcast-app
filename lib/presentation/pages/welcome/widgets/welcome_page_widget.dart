import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:podcast_app/application/wellcome/wellcome_bloc.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wellcomeBloc = BlocProvider.of<WellcomeBloc>(context);
    return BlocConsumer<WellcomeBloc, WellcomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is HaveUserCredWellcomeState) {
          context.router.replace(HomeRoute());
        }
      },
      builder: (context, state) {
        if (state is InitialWellcomeState) {
          return _getWellcomeLoadingPage(wellcomeBloc);
        } else if (state is HaveUserCredWellcomeState) {
          return _getWellcomeLoadingPage(wellcomeBloc);
        } else if (state is UserCredNotAvilableWellcomState) {
          return _getWellComePage(context);
        }
        // wellcomeBloc.add(HaveCredLocalWellcomeEvent());

        return _getWellComePage(context);
        // return _getWellcomeLoadingPage();
      },
    );
  }

  Widget _getWellcomeLoadingPage(WellcomeBloc wellcomeBloc) {
    wellcomeBloc.add(HaveCredLocalWellcomeEvent());

    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getWellComePage(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Image.asset(
              "assets/images/welcome.png",
              height: 343,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(41.0, 140.0, 41.0, 41.0),
              child: Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Welcome to Dimts Podcast !",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "This is some discription about our app any thing about our app",
                          // key: Key("wellCome"),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  HexColor("#579EB5"),
                                  HexColor("#8EB9C7")
                                ]),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ElevatedButton(
                            key: Key('getStarted'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              context.router.push(SigninRoute());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 50.0),
                                      child: Text("GET STARTED"),
                                    ),
                                    Icon(Icons.arrow_forward_sharp),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
