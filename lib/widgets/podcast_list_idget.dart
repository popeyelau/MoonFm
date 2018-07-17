import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:moonfm/models/RowItem.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/view_models/home.dart';
import 'package:moonfm/widgets/podcast_item_widget.dart';
import 'package:redux/redux.dart';

class PodcastListWidget extends StatelessWidget {
  final Function onSelected;

  PodcastListWidget({this.onSelected});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReduxState, HomeViewModel>(
      converter: (Store<ReduxState> store) => HomeViewModel(store),
      builder: (BuildContext context, HomeViewModel vm) {
        final podcasts = vm.podcasts;
        return ListView.builder(
          itemExtent: 90.0,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final podcast = podcasts[index];
            return PodcastItemWidget(
              item: podcasts[index],
              index: index,
              onPress: () => onSelected(podcast),
              onAdd: () => vm.addToList(podcast),
              onDownload: () => vm.addToDownload(podcast),
              onFavorite: () => vm.addToFavorite(podcast),
            );
          },
          itemCount: vm.podcasts.length,
        );
      },
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
