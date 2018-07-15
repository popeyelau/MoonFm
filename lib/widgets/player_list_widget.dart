import 'package:flutter/material.dart';
import 'package:moonfm/models/PodcastItem.dart';

class PlaylistWidget extends StatelessWidget {
  final List<PodcastItem> playlist;
  PlaylistWidget(this.playlist);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0 * playlist.length + 17.0,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        elevation: 0.0,
        margin: EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemExtent: 64.0,
          itemBuilder: (context, index) {
            final item = playlist[index];
            return Container(
              color: index % 2 == 0
                  ? Theme.of(context).canvasColor
                  : Theme.of(context).cardColor,
              child: GestureDetector(
                onTap: () {},
                child: ListTile(
                    key: Key(item.title),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                    title: Text(
                      item.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    subtitle: Text(item.title),
                    leading: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.cover)),
                        ))),
              ),
            );
          },
          itemCount: playlist.length,
        ),
      ),
    );
  }
}
