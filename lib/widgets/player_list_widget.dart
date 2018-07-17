import 'package:flutter/material.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/widgets/empty_widget.dart';

class PlaylistWidget extends StatelessWidget {
  final List<PodcastItem> playlist;
  PlaylistWidget({this.playlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        elevation: 0.0,
        margin: EdgeInsets.all(8.0),
        child: playlist.isEmpty
            ? EmptyWidget(description: "Empty Play List",)
            : ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemExtent: 64.0,
                itemBuilder: (context, index) {
                  final item = playlist[index];
                  return Container(
                    color: index.isEven
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).cardColor,
                    child: GestureDetector(
                      onTap: () {},
                      child: ListTile(
                          key: Key(item.title),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 0.0),
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
