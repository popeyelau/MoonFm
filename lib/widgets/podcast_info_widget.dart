import 'package:flutter/material.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/redux/main.dart';

class PodcastInfoWidget extends StatelessWidget {
  final PodcastItem item;
  PodcastInfoWidget(this.item);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        StoreContainer.global.state.app.theme != Themes.light;
    return Container(
      child: Card(
        elevation: 0.0,
        color: isDarkMode ? Color(0xff131313) : Theme.of(context).cardColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 5.0),
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(item.cover))),
                  ),
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.body1,
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(item.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).accentTextTheme.body2)
            ],
          ),
        ),
      ),
    );
  }
}
