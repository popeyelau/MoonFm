import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfm/config/App.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/widgets/fetch_state_widget.dart';
import 'package:moonfm/widgets/floating_indicator.dart';
import 'package:moonfm/widgets/home_bar_widget.dart';
import 'package:moonfm/widgets/play_bar_widget.dart';
import 'package:moonfm/widgets/podcast_list_idget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller;
  double offsetY = 0.0;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      setState(() {
        offsetY = controller.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppTheme.bloc.systemUiOverlayStyle);
    final pinned = offsetY >= 76.0;
    return new Scaffold(
        appBar: AppBar(
          brightness:
              AppTheme.bloc.systemUiOverlayStyle == SystemUiOverlayStyle.light
                  ? Brightness.dark
                  : Brightness.light,
          elevation: 0.0,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            "Moon FM",
            style: Theme.of(context).textTheme.title,
          ),
          centerTitle: false,
        ),
        body: Container(
          margin: EdgeInsets.all(0.0),
          child: Stack(
            children: <Widget>[
              ListView(
                controller: controller,
                children: <Widget>[
                  HomeBarWidget(),
                  SizedBox(
                    height: 75.0,
                  ),
                  FetchStateWidget(),
                  PodcastListWidget(
                    onSelected: (PodcastItem item) => showTips(item),
                  ),
                ],
              ),
              Positioned(
                top: pinned ? 0.0 : 76.0 - offsetY,
                left: 0.0,
                right: 0.0,
                child: PlayBarWidget(
                  pinned: pinned,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:
            FloatingIndicator() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void showTips(PodcastItem item) {
    final List<Widget> children = [];
    Mock.actions.asMap().forEach((i, value) {
      children.add(GestureDetector(
        child: IconListTile(value, Theme.of(context).backgroundColor),
        onTap: () {
          Navigator.of(context).pop();
          Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).dialogBackgroundColor,
                  content: Text(value.title,
                      style: TextStyle(color: Theme.of(context).accentColor)),
                ),
              );
        },
      ));
    });

    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
              titlePadding: EdgeInsets.all(0.0),
              contentPadding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              title: Stack(
                alignment: Alignment(1.0, 0.0),
                children: <Widget>[
                  Positioned(
                      child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).accentColor.withAlpha(200),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ))
                ],
              ),
              children: children);
        });
  }
}
