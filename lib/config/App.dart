import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:rxdart/rxdart.dart';

enum PlayerState { normal, playing, pause, stop, completed }

class PlayerInfo {
  final PlayerState state;
  final int duration;
  final List<PodcastItem> playlist;

  PlayerInfo({this.state, this.playlist, this.duration});
}

class Applicaton {
  static final AudioPlayer audioPlayer = AudioPlayer();
}

class PlayerBloc {
  final List<PodcastItem> _podcasts = Mock.playlist;
  PlayerState _state = PlayerState.normal;
  int _durationValue = 0;

  final _playlist = BehaviorSubject<PlayerInfo>();

  Stream<PlayerInfo> get playlist => _playlist.stream;

  final _playingController = StreamController<PodcastItem>();
  Sink<PodcastItem> get podcasts => _playingController.sink;

  final _playerState =
      BehaviorSubject<PlayerState>(seedValue: PlayerState.normal);
  final _playerStateController = StreamController<PlayerState>();

  Sink<PlayerState> get stateUpdater => _playerStateController.sink;
  Stream<PlayerState> get state => _playerStateController.stream;

  final _duration = BehaviorSubject<int>(seedValue: 0);
  final _duratinController = StreamController<int>();

  Sink<int> get durationUpdater => _duratinController.sink;
  Stream<int> get duration => _duratinController.stream;

  PlayerBloc() {
    _playingController.stream.listen(_handleAdd);
    _playerStateController.stream.listen(_handlePlayerState);
    _duratinController.stream.listen(_handleDuration);
  }

  void _handleAdd(PodcastItem item) {
    _podcasts.insert(0, item);
    _playlist.add(PlayerInfo(
        state: _state, playlist: _podcasts, duration: _durationValue));
  }

  void _handlePlayerState(PlayerState state) {
    _state = state;
    _playlist.add(PlayerInfo(
        state: _state, playlist: _podcasts, duration: _durationValue));
  }

  void _handleDuration(int duration) {
    _durationValue = duration;
    _playlist.add(
        PlayerInfo(state: _state, playlist: _podcasts, duration: duration));
  }

  void dispose() {
    _playlist.close();
    _playingController.close();
    _playerStateController.close();
  }
}

class PlayerProvider extends InheritedWidget {
  final PlayerBloc playerBloc;

  PlayerProvider({
    Key key,
    PlayerBloc playerBloc,
    Widget child,
  })  : playerBloc = playerBloc ?? PlayerBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PlayerBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(PlayerProvider) as PlayerProvider)
          .playerBloc;
}
