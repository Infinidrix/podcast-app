import 'package:flutter/material.dart';

class TimeSlider extends StatefulWidget {
  const TimeSlider({Key? key}) : super(key: key);

  @override
  _TimeSliderState createState() => _TimeSliderState();
}

class _TimeSliderState extends State<TimeSlider> {
  double _current_time = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            value: _current_time,
            onChanged: (double value) {
              setState(() {
                _current_time = value;
              });
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$_current_time",
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "3:00",
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
