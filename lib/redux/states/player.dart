import 'package:flutter/foundation.dart';
import 'package:moonfm/models/PodcastItem.dart';

@immutable
class PlayerState {
  final List<PodcastItem> playlist;
  final int duration;
  final PodcastItem playing;

  PlayerState({this.playlist, this.duration, this.playing});

  PlayerState copyWith({List<PodcastItem> playlist, int duration, PodcastItem playing}) {
    return PlayerState(
        playlist: playlist ?? this.playlist,
        duration: duration ?? this.duration);
  }

  PlayerState.initialState()
      : playlist = [],
        duration = 0,
        playing = null;
}
