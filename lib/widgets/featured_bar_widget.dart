import 'package:flutter/material.dart';

class FeaturedBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      padding: EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [1, 2, 3, 4, 5].map((_) => FeaturedBarItemWidget()).toList(),
      ),
    );
  }
}

class FeaturedBarItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Planet Money",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Theme.of(context).textTheme.body2.color),
                ),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://moon.fm/static/images/podcast/full/5cd716fc920b93ae923174ab9ab819c3f682d71e.jpg"))),
              ),
              Text(
                  '''The economy explained. Imagine you could call up a friend and say, "Meet me at the bar and tell me what's going on with the economy." Now imagine that's actually a fun evening.''',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.body2)
            ],
          ),
        ),
      ),
    );
  }
}
