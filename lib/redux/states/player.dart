import 'package:flutter/foundation.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/PodcastItem.dart';

@immutable
class PlayerState {
  final List<PodcastItem> playlist;
  final int duration;
  final int playedDuration;
  final PodcastItem playing;
  final bool isPlaying;

  PlayerState(
      {this.playlist,
      this.duration,
      this.playedDuration,
      this.playing,
      this.isPlaying});

  PlayerState copyWith(
      {List<PodcastItem> playlist,
      int duration,
      int playedDuration,
      PodcastItem playing,
      bool isPlaying}) {
    return PlayerState(
        playlist: playlist ?? this.playlist,
        duration: duration ?? this.duration,
        playedDuration: playedDuration ?? this.playedDuration,
        playing: playing ?? this.playing,
        isPlaying: isPlaying ?? this.isPlaying);
  }

  PlayerState.initialState()
      : playlist = Mock.playlist,
        duration = 0,
        playedDuration = 0,
        playing = Mock.playlist[0],
        isPlaying = false;
}
