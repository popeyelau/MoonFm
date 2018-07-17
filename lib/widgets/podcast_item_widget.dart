import 'package:flutter/material.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/widgets/date_widget.dart';
import 'package:moonfm/widgets/podcast_info_widget.dart';
import 'package:moonfm/widgets/swide_widget.dart';

class PodcastItemWidget extends StatelessWidget {
  final int index;
  final PodcastItem item;
  final VoidCallback onPress;
  final VoidCallback onAdd;
  final VoidCallback onDownload;
  final VoidCallback onFavorite;

  PodcastItemWidget(
      {this.item,
      this.index,
      this.onPress,
      this.onAdd,
      this.onDownload,
      this.onFavorite});

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [];
    if (index.isEven) contents.add(DateWidget(month: "Jul", date: "13"));

    contents.add(Expanded(
      child: FXLeftSlide(
        backgroundColor: Colors.transparent,
        buttons: [
          FXRightSideButton(
              icon: Icons.playlist_add, iconColor: Colors.blue, onPress: onAdd),
          FXRightSideButton(
              icon: Icons.file_download,
              iconColor: Colors.green,
              onPress: onDownload),
          FXRightSideButton(
              icon: Icons.star,
              iconColor: Colors.yellow[600],
              onPress: onFavorite),
        ],
        child: Container(
          child: PodcastInfoWidget(item),
        ),
        key: Key(DateTime.now().toString()),
      ),
    ));

    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contents)),
    );
  }
}
