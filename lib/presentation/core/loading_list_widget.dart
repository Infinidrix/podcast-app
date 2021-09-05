import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skeleton_text/skeleton_text.dart';

class LoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: HexColor('#282828')),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,

                // SkeletonAnimation method
                children: <Widget>[
                  SkeletonAnimation(
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: HexColor('#202020'),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 5.0),
                          child: SkeletonAnimation(
                            child: Container(
                              height: 15,
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: HexColor('#202020')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SkeletonAnimation(
                              child: Container(
                                width: 60,
                                height: 13,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: HexColor('#202020')),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
