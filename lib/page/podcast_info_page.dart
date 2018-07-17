import 'package:flutter/material.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/page/podcast_about_page.dart';
import 'package:moonfm/page/result_page.dart';

class PodcastInfoPage extends StatefulWidget {
  final PodcastItem podcast;
  PodcastInfoPage({this.podcast});
  @override
  PodcastInfoPageState createState() {
    return new PodcastInfoPageState();
  }
}

class PodcastInfoPageState extends State<PodcastInfoPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(widget.podcast.title, style: Theme.of(context).textTheme.title,),
        elevation: .0,
      ),
      body: Container(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                child: Material(
                  color: Theme.of(context).backgroundColor,
                  child: TabBar(
                    controller: controller,
                    labelColor: Theme.of(context).textTheme.body1.color,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: <Widget>[
                      Tab(
                        text: "ABOUT",
                      ),
                      Tab(
                        text: "EPISODES",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: <Widget>[
                    PodcastAboutPage(
                      podcast: widget.podcast,
                    ),
                    ResultPage(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
