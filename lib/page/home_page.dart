import 'package:flutter/material.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/page/podcast_info_page.dart';
import 'package:moonfm/redux/actions/home.dart';
import 'package:moonfm/redux/actions/player.dart';
import 'package:moonfm/redux/main.dart';
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
    final pinned = offsetY >= 76.0;
    return new Scaffold(
        appBar: AppBar(
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
          switch (value.title) {
            case "Play Now":
              StoreContainer.global.dispatch(PlayNow(payload: item));
              break;
            case "Play Next":
              StoreContainer.global.dispatch(PlayNext(payload: item));
              break;
            case "Play Later":
              StoreContainer.global.dispatch(AddToList(payload: item));
              break;
            case "Save Episode":
              StoreContainer.global.dispatch(AddToDownload(payload: item));
              break;
            case "Favorite":
              StoreContainer.global.dispatch(AddToFavorite(payload: item));
              break;
            case "Share Episode":
              break;
            default:
              break;
          }

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
              titlePadding: EdgeInsets.all(8.0),
              contentPadding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              title: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PodcastInfoPage(
                              podcast: item,
                            )),
                  );
                },
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildDialogHeader(item),
                        Text(
                          item.subtitle,
                          style: Theme.of(context).textTheme.body2,
                        )
                      ],
                    )
                  ],
                ),
              ),
              children: children);
        });
  }

  Widget _buildDialogHeader(PodcastItem item) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Container(
                  width: 30.0,
                  height: 30.0,
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(item.cover)),
                  )),
              Text(
                item.title,
                style: Theme.of(context).textTheme.body1,
              )
            ],
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.close,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () => Navigator.of(context).pop())
      ],
    );
  }
}
