import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/Mock.dart';

class PodcastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppTheme.bloc.systemUiOverlayStyle);
    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListView.builder(
        itemCount: Mock.podcastTypes.length,
        itemExtent: 48.0,
        itemBuilder: (context, index) {
          final item = Mock.podcastTypes[index];
          return Container(
            padding: EdgeInsets.all(8.0),
            color: index % 2 == 0
                ? Theme.of(context).canvasColor
                : Theme.of(context).cardColor,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 8.0,
                ),
                Icon(
                  item.icon,
                  color: item.iconColor,
                  size: 26.0,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Text(item.title),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
