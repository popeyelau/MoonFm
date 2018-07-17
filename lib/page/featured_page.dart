import 'package:flutter/material.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/widgets/featured_bar_widget.dart';
import 'package:moonfm/widgets/podcast_group_widget.dart';

class FeaturedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          FeaturedBarWidget(),
          PodcastGroupWidget(title: "Podcast", items: Mock.discoverPodcasts),
          PodcastGroupWidget(title: "Radio", items: Mock.discoverRadios)
        ],
      ),
    );
  }
}
