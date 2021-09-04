import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_bloc.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_event.dart';
import 'package:podcast_app/application/create_podcast/create_podcast_state.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CreatePodcastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final episodeName = TextEditingController();
    final episodeDescription = TextEditingController();
    File? file;

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
            child: BlocConsumer<CreatePodcastBloc, CreatePodcastState>(
              builder: (context, createPodcastSate) {
                Widget fileUploadingChoices =
                    FileUploadingChoices("please select a file");
                Widget buttonContent = Text("Save");

                if (createPodcastSate is Recorded) {
                  //TODO : add the recorder file to the form
                }

                if (createPodcastSate is FilePicked) {
                  file = createPodcastSate.file;
                  // TODO: chnage the UI to refelct the file is uploaded
                  fileUploadingChoices =
                      FileEntry(filename: file!.path.split('/').last);
                }
                if (createPodcastSate is FilePickingError) {
                  Widget fileUploadingChoices = FileUploadingChoices(
                      "File Picking Error, Please Try agin");
                }

                if (createPodcastSate is Saving) {
                  buttonContent = SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(),
                  );
                  fileUploadingChoices =
                      FileEntry(filename: file!.path.split('/').last);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PageTitle(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 50.0),
                    ),
                    Text(
                      "Episode Name",
                      style: TextStyle(color: Colors.white),
                    ),
                    FormField(
                      icon: Icon(Icons.mic_none),
                      lineCount: 1,
                      hint: "The name of the episode",
                      controller: episodeName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter episode name';
                        }
                        return null;
                      },
                    ),
                    Text(
                      "Description",
                      style: TextStyle(color: Colors.white),
                    ),
                    FormField(
                      icon: Icon(Icons.description_outlined),
                      lineCount: 3,
                      hint: "Description of the episode",
                      controller: episodeDescription,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter a description text';
                        }
                        return null;
                      },
                    ),
                    Text(
                      "File",
                      style: TextStyle(color: Colors.white),
                    ),
                    fileUploadingChoices,
                    SaveButton(
                        formKey: formKey,
                        file: file,
                        buttonContent: buttonContent)
                  ],
                );
              },
              listener: (context, createPodcastState) {
                if (createPodcastState is Recording) {
                  //Navigate to recorder page
                }
                if (createPodcastState is Saved) {
                  context.router.pop();
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
    required this.formKey,
    required this.file,
    required this.buttonContent,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final File? file;
  final Widget buttonContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            final createPodcastBloc =
                BlocProvider.of<CreatePodcastBloc>(context);
            final isValid = formKey.currentState?.validate();
            if (file == null) {
              return;
            }
            if (!isValid!) {
              return;
            }
            createPodcastBloc.add(SaveEvent());
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Center(
                child: buttonContent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Create Podcast",
      style: TextStyle(
        color: Colors.white,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}

class FileUploadingChoices extends StatelessWidget {
  final String message;
  FileUploadingChoices(this.message);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          GestureDetector(
            onTap: () {
              final createPodcastBloc =
                  BlocProvider.of<CreatePodcastBloc>(context);
              createPodcastBloc.add(RecordEvent());
              //TODO : go to podcast page
            },
            child: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Column(children: [
                Icon(Icons.mic_none, size: 60.0),
                Text(
                  "Record",
                  style: TextStyle(fontSize: 16),
                )
              ]),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
          )),
          GestureDetector(
            onTap: () {
              final createPodcastBloc =
                  BlocProvider.of<CreatePodcastBloc>(context);
              createPodcastBloc.add(UploadEvent());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Column(children: [
                Icon(Icons.file_upload_outlined, size: 60.0),
                Text(
                  "Upload",
                  style: TextStyle(fontSize: 16),
                )
              ]),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Center(
        child: Text(
          message,
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    ]);
  }
}

class FileEntry extends StatelessWidget {
  final String filename;
  FileEntry({required this.filename});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(text: filename),
    );
  }
}

// ignore: must_be_immutable
class FormField extends StatelessWidget {
  Icon icon;
  int lineCount;
  String hint;
  TextEditingController controller;
  String? Function(String?)? validator;

  FormField(
      {required this.icon,
      required this.lineCount,
      required this.hint,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
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
          hintStyle: TextStyle(color: Colors.grey),
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
}
