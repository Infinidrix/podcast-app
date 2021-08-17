import 'package:flutter/material.dart';
import 'package:podcast_app/presentation/pages/search/widgets/search_page_widget.dart';
import 'constants.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(child: SearchBar()),
    );
  }
}
