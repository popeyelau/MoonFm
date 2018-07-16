import 'package:flutter/foundation.dart';
import 'package:moonfm/models/PodcastItem.dart';

@immutable
class PlayerState {
  final List<PodcastItem> playlist;
  final int duration;

  PlayerState({this.playlist, this.duration});

  PlayerState copyWith({List<PodcastItem> playlist, int duration}) {
    return PlayerState(
        playlist: playlist ?? this.playlist,
        duration: duration ?? this.duration);
  }

  PlayerState.initialState()
      : playlist = [],
        duration = 0;
}
