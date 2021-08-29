import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Recorder extends StatelessWidget {
  const Recorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#282828"),
      appBar: AppBar(
        backgroundColor: HexColor("#282828"),
        title: Center(
          child: Text(
            "Recorder",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blueAccent),
                  height: 200,
                  width: 200,
                  child: Icon(
                    Icons.settings_voice_sharp,
                    color: Colors.white,
                    size: 100,
                  )),
              SizedBox(
                height: 45,
              ),
              Text(
                "00: 04: 33",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                ),
              ),
              SizedBox(height: 15),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.pause,
                    color: Colors.white,
                    size: 55,
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 170,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.stop,
                          color: Colors.red,
                          size: 40,
                        ),
                        Text(
                          "Stop",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
