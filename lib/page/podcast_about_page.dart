import 'package:flutter/material.dart';
import 'package:moonfm/models/PodcastItem.dart';

class PodcastAboutPage extends StatelessWidget {
  final PodcastItem podcast;
  const PodcastAboutPage({Key key, this.podcast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          _buildHeader(context),
          SizedBox(
            height: 16.0,
          ),
          _buildRow(context,
              icon: Icons.add, color: Colors.blue, title: "Subscribe"),
          SizedBox(
            height: 16.0,
          ),
          _buildRow(context,
              icon: Icons.star, color: Colors.yellow[800], title: "Favorite")
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: 40.0,
                  height: 40.0,
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(podcast.cover)),
                  )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    podcast.title,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Text(podcast.auth, style: Theme.of(context).textTheme.body2),
                ],
              ))
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Divider(),
          Text(
            "你有多久没有安静的听一首歌，你有多久没有让一段旋律流进心中。人生的旅途上，有太多纷扰，此刻，安静下吧，让这一首民谣，陪你在路上，聆听民谣，聆听有故事的声音。边走边唱，且歌且行，民谣一直在路上。",
            style: TextStyle(height: 1.2),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context,
      {IconData icon, color: Color, String title}) {
    return Container(
        height: 48.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(child: Text(title))
          ],
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8.0)));
  }
}
