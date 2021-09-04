import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/create_channel/create_channel_bloc.dart';
import 'package:podcast_app/application/create_channel/create_channel_state.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CreateChannelWidget extends StatelessWidget {
  Widget getFormField(Icon icon, int lineCount, String hint) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
      child: TextFormField(
        minLines: lineCount,
        maxLines: lineCount,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          helperStyle: TextStyle(color: Colors.white),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          fillColor: Colors.white,
          prefixIcon: icon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget saveButton = Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [HexColor("#579EB5"), HexColor("#8EB9C7")]),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            context.router.popAndPush(CreatePodcastRoute());
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Center(
                child: Text("Save"),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: BlocConsumer<CreateChannelBloc, CreateChannelState>(
          builder: (context, createchannelstate) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0.0),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      "Create Channel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 105.0),
                    ),
                    Text(
                      "Channel Name",
                      style: TextStyle(color: Colors.grey),
                    ),
                    getFormField(
                        Icon(Icons.mic_none), 1, "The name of the channel"),
                    Text(
                      "Description",
                      style: TextStyle(color: Colors.grey),
                    ),
                    getFormField(Icon(Icons.description_outlined), 3,
                        "Description of the channel"),
                    Text(
                      "Cover Photo",
                      style: TextStyle(color: Colors.grey),
                    ),
                    getFormField(
                        Icon(Icons.insert_photo_outlined), 1, "Attach photo"),
                    saveButton,
                  ],
                ),
              ]),
            );
          },
          listener: (context, createchannelstate) {
            
          }),
    );
  }
}
