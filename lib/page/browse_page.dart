import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/page/live_radio_page.dart';
import 'package:moonfm/page/podcast_page.dart';
import 'package:moonfm/widgets/floating_indicator.dart';

class BrowsePage extends StatefulWidget {
  BrowsePage({Key key}) : super(key: key);

  @override
  _BrowsePageState createState() => new _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage>
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

    return new Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            "Browse",
            style: Theme.of(context).textTheme.title,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/search");
              },
            )
          ],
          elevation: 0.0,
          centerTitle: false,
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                color: Theme.of(context).backgroundColor,
                child: Material(
                  color: Theme.of(context).backgroundColor,
                  child: TabBar(
                    controller: controller,
                    labelColor: Theme.of(context).textTheme.body1.color,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: <Widget>[
                      Tab(
                        text: "PODCAST",
                      ),
                      Tab(
                        text: "LIVE RADIO",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: <Widget>[PodcastPage(), LiveRadioPage()],
                ),
              )
            ],
          ),
        ),
        floatingActionButton:
            FloatingIndicator() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
