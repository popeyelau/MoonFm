import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/PodcastItem.dart';

class PodcastListPage extends StatelessWidget {
  final List<PodcastItem> list = Mock.discoverPodcasts;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppTheme.bloc.systemUiOverlayStyle);

    return new Scaffold(
      appBar: AppBar(
        centerTitle: false,
        brightness:
            AppTheme.bloc.systemUiOverlayStyle == SystemUiOverlayStyle.light
                ? Brightness.dark
                : Brightness.light,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "",
          style: Theme.of(context).textTheme.title,
        ),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = list[index];
          return Container(
            color: index % 2 == 0
                ? Theme.of(context).canvasColor
                : Theme.of(context).cardColor,
            child: ListTile(
              leading: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(item.cover)),
                  )),
              title: Text(item.title),
              subtitle: Text(item.auth),
            ),
          );
        },
        itemExtent: 64.0,
        itemCount: list.length,
      ),
    );
  }
}
