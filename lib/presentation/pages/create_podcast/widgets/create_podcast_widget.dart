import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_bloc.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_event.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_state.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CreatePodcastWidget extends StatelessWidget {
  Widget getFormField(Icon icon, int lineCount, String hint,
      TextEditingController controller, String? Function(String?)? validator) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
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
    final formKey = GlobalKey<FormState>();
    final episodeName = TextEditingController();
    final episodeDescription = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0.0),
        child: ListView(children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "Create Podcast",
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
                  "Episode Name",
                  style: TextStyle(color: Colors.grey),
                ),
                getFormField(
                  Icon(Icons.mic_none),
                  1,
                  "The name of the episode",
                  episodeName,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter episode name';
                    }
                    return null;
                  },
                ),
                Text(
                  "Description",
                  style: TextStyle(color: Colors.grey),
                ),
                getFormField(
                  Icon(Icons.description_outlined),
                  3,
                  "Description of the episode",
                  episodeDescription,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter a description text';
                    }
                    return null;
                  },
                ),
                Text(
                  "File",
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Column(children: [
                        Icon(Icons.mic_none, size: 60.0),
                        Text(
                          "Record",
                          style: TextStyle(fontSize: 16),
                        )
                      ]),
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerLeft,
                    )),
                    Padding(
                      padding: EdgeInsets.only(right: 30.0),
                      child: Column(children: [
                        Icon(Icons.file_upload_outlined, size: 60.0),
                        Text(
                          "Upload",
                          style: TextStyle(fontSize: 16),
                        )
                      ]),
                    ),
                  ],
                ),
                BlocConsumer<CreatePodcastBloc, CreatePodcastState>(
                  builder: (context, createPodcastSate) {
                    if (createPodcastSate is Recorded) {
                      //TODO : add the recorder file to the form
                    }

                    if (createPodcastSate is Uploaded) {
                      // TODO: add the file to the form
                    }
                    if (createPodcastSate is UploadingError) {
                      // TODO : Show some info to the user
                    }

                    if (createPodcastSate is Saving) {
                      // TODO : show the progress on the button
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 50.0),
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
                            final createPodcastBloc =
                                BlocProvider.of<CreatePodcastBloc>(context);
                            final isValid = formKey.currentState?.validate();
                            if (!isValid!) {
                              return;
                            }
                            createPodcastBloc.add(SaveEvent());
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
                  },
                  listener: (context, createPodcastState) {
                    if (createPodcastState is Recording) {
                      //Navigate to recorder page
                    }
                    if (createPodcastState is Saved) {
                      //Navigate back to Your Channel Page
                    }
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
