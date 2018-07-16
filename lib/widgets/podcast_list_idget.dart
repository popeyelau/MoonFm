import 'package:flutter/material.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/RowItem.dart';
import 'package:moonfm/widgets/podcast_item_widget.dart';

class PodcastListWidget extends StatelessWidget {
  final Function onSelected;

  PodcastListWidget({this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemExtent: 90.0,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return PodcastItemWidget(
            item: Mock.home[index],
            index: index,
            onPress: () {
              onSelected(Mock.home[index]);
            },
          );
        },
        itemCount: Mock.home.length,
      ),
    );
  }
}

class IconListTile extends StatelessWidget {
  final RowItem item;
  final Color backgroundColor;
  IconListTile(this.item, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 48.0,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 8.0, right: 16.0),
            child: Icon(
              item.icon,
              color: item.iconColor,
            ),
            margin: EdgeInsets.fromLTRB(8.0, 0.0, 16.0, 0.0),
          ),
          Expanded(
            child: Text(item.title),
          )
        ],
      ),
    );
  }
}
