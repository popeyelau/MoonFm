import 'package:flutter/material.dart';
import 'package:moonfm/models/PodcastItem.dart';

class PodcastGroupWidget extends StatelessWidget {
  final List<PodcastItem> items;
  final String title;
  static const double rowHeight = 70.0;

  PodcastGroupWidget({this.title, this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: rowHeight * items.length + 16.0 + 30.0,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: Card(
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        margin: EdgeInsets.all(0.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 30.0,
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.whatshot,
                    color: Colors.redAccent,
                    size: 16.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 13.0, color: Colors.grey),
                  )
                ],
              ),
            ),
            Positioned(
              top: 30.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                itemExtent: rowHeight,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    // color: index % 2 == 0 ? Colors.grey[50] : Colors.white,
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
                                fit: BoxFit.cover,
                                image: NetworkImage(item.cover)),
                          )),
                      title: Text(item.title),
                      subtitle: Text(item.auth),
                    ),
                  );
                },
                itemCount: items.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
