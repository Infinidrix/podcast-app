import 'package:flutter/material.dart';

class DescriptionAndNumberOfListinersTile extends StatelessWidget {
  const DescriptionAndNumberOfListinersTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "description of the channel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(Icons.edit_outlined),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "1, 456, 456 Montly listeners",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
