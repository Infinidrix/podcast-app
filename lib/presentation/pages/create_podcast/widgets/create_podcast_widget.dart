import 'package:auto_route/auto_route.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CreatePodcastWidget extends StatelessWidget {

  Widget getFormField(Icon icon, int lineCount, String hint){
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
            context.router.pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Center(child: Text("Save"),
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
          leading: IconButton(onPressed: (){context.router.pop();}, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0.0),
          child: ListView(
            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text(
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
                getFormField(Icon(Icons.mic_none), 1, "The name of the episode"),
                Text(
                  "Description",
                  style: TextStyle(color: Colors.grey),
                ),
                getFormField(Icon(Icons.description_outlined), 3, "Description of the episode"),
                Text(
                  "File",
                  style: TextStyle(color: Colors.grey),
                ),
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0), 
                    child: Column(children: [
                      Icon(
                          Icons.mic_none,
                          size: 60.0
                        ),
                      Text("Record",
                      style: TextStyle(fontSize: 16),)
                    ]),
                  ),
                  Expanded(child: 
                    Align(
                      alignment: Alignment.centerLeft, 
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30.0), 
                    child: Column(children: [
                      Icon(
                          Icons.file_upload_outlined,
                          size: 60.0
                        ),
                      Text("Upload",
                      style: TextStyle(fontSize: 16),)
                    ]),
                  ),
                ],),

                saveButton,
              ],
            ),
            ]
          ),
        ),
    );
  }
}
