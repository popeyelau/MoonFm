import 'package:flutter/material.dart';
import 'package:moonfm/models/PodcastItem.dart';

class PlayBarWidget extends StatelessWidget {
  final bool pinned;
  final bool showCover;
  final Function onPlay;
  final VoidCallback onNext;
  final VoidCallback onRewind;
  final bool isPlaying;
  final PodcastItem playing;

  PlayBarWidget(
      {this.pinned = false,
      this.playing,
      this.showCover = true,
      this.isPlaying = false,
      this.onPlay,
      this.onNext,
      this.onRewind});

  @override
  Widget build(BuildContext context) {
    final playIcon = isPlaying ? Icons.pause : Icons.play_arrow;
    return Container(
      color: pinned ? Theme.of(context).backgroundColor : null,
      height: 75.0,
      child: Card(
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.fast_rewind,
                        color: Colors.blue[200],
                      ),
                      onPressed: onRewind),
                  IconButton(
                      icon: Icon(
                        playIcon,
                        color: Colors.blue,
                        size: 34.0,
                      ),
                      onPressed: () => onPlay(playing)),
                  IconButton(
                      icon: Icon(Icons.fast_forward, color: Colors.blue[200]),
                      onPressed: onNext),
                  IconButton(
                      icon: Icon(
                        Icons.stop,
                        color: Colors.pink,
                      ),
                      onPressed: () {}),
                ],
              ),
              Expanded(child: _rigitSide())
            ],
          ),
        ),
      ),
    );
  }

  Widget _rigitSide() {
    final List<Widget> children = [
      IconButton(
          icon: Icon(
            Icons.brightness_2,
            color: Colors.blue,
            size: 18.0,
          ),
          onPressed: () {})
    ];

    if (showCover) {
      children.add(Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/album.jpg"))),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: children,
    );
  }
}
