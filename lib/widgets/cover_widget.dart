import 'package:flutter/material.dart';

class CoverWidget extends StatelessWidget {
  final String cover;
  final String title;

  CoverWidget({this.title, this.cover});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Stack(
              alignment: Alignment(0.0, 0.0),
              children: <Widget>[
                Container(
                  width: 240.0,
                  height: 240.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/album_frame.png"))),
                ),
                FadeInImage(
                  fit: BoxFit.cover,
                  width: 165.0,
                  height: 165.0,
                  image: NetworkImage(
                    cover,
                  ),
                  placeholder: AssetImage("assets/images/album.jpg"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(title ?? "Moon.FM"),
          )
        ],
      ),
    );
  }
}
