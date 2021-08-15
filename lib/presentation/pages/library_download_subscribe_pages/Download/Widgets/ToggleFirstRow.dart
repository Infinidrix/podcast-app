import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';

class ToggleRow extends StatefulWidget {
  const ToggleRow({Key? key}) : super(key: key);

  @override
  _ToggleRowState createState() => _ToggleRowState();
}

class _ToggleRowState extends State<ToggleRow> {
  bool isToggled = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          color: mainBackGroundColor,
          child: Container(
            color: mainBackGroundColor,
            margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: mainBackGroundColor,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Downloading...',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                color: mainBackGroundColor,
                                child: CupertinoSwitch(
                                  value: isToggled,
                                  activeColor: Color(0xff579EB5),
                                  trackColor: Color(0xff282828),
                                  onChanged: (value) {
                                    setState(() {
                                      isToggled = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

