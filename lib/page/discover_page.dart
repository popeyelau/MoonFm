import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/page/featured_page.dart';
import 'package:moonfm/page/top_charts_page.dart';
import 'package:moonfm/widgets/appbar.dart';
import 'package:moonfm/widgets/floating_indicator.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key}) : super(key: key);

  @override
  _DiscoverPageState createState() => new _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: customAppBar(
          context,
          title: "Discover",
          bottom: TabBar(
            controller: controller,
            labelColor: Theme.of(context).textTheme.title.color,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(
                text: "FEATURED",
              ),
              Tab(
                text: "TOP CHARTS",
              ),
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            controller: controller,
            children: <Widget>[FeaturedPage(), TopChartsPage()],
          ),
        ),
        floatingActionButton: FloatingIndicator()
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
