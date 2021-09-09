import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skeleton_text/skeleton_text.dart';

class LoadingSkeletonText extends StatelessWidget {
  const LoadingSkeletonText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      borderRadius: BorderRadius.circular(10.0),
      shimmerColor: 2 % 2 != 0 ? Colors.grey : Colors.white54,
      child: Container(
        height: 15,
        width: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: HexColor('#202020')),
      ),
    );
  }
}
