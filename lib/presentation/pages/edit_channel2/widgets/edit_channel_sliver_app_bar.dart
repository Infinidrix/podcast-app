import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:podcast_app/presentation/pages/edit_channel/edit_channel.dart';
import 'package:podcast_app/presentation/routes/router.gr.dart';

class EditChannelSliverAppBar extends StatelessWidget {
  const EditChannelSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 260,
      flexibleSpace: FlexibleSpaceBar(
        background: FlutterLogo(),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Your Channel",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(onTap: () => context.router.push(EditChannelDetailRoute(Name: "Hanan", Description: "Description", Image: "")),
                child: Icon(Icons.edit_outlined)),
            ],
          ),
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
