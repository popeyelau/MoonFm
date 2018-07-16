import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:rxdart/rxdart.dart';

enum ControlState { normal, playing, pause, stop, completed }

class PlayerState {
  final ControlState state;
  final int duration;
  PlayerState({this.state, this.duration});

  @override
  String toString() {
    return "state:$state  duration:$duration";
  }
}

class PlayerInfo {
  final PlayerState state;
  final List<PodcastItem> playlist;

  PlayerInfo({this.state, this.playlist});
}

class Applicaton {
  static final AudioPlayer audioPlayer = AudioPlayer();
}

class PlayerBloc {
  final List<PodcastItem> _podcasts = Mock.playlist;
  PlayerState _state = PlayerState(state: ControlState.normal, duration: 0);

  final _playlist = BehaviorSubject<PlayerInfo>();
  Stream<PlayerInfo> get playlist => _playlist.stream;

  final _playingController = StreamController<PodcastItem>();
  Sink<PodcastItem> get podcasts => _playingController.sink;

  final _playerStateController = StreamController<PlayerState>();
  Sink<PlayerState> get stateUpdater => _playerStateController.sink;
  Stream<PlayerState> get state => _playerStateController.stream;

  PlayerBloc() {
    _playingController.stream.listen(_handleAdd);
    _playerStateController.stream.listen(_handlePlayerState);
  }

  void _handleAdd(PodcastItem item) {
    _podcasts.insert(0, item);
    _playlist.add(PlayerInfo(state: _state, playlist: _podcasts));
  }

  void _handlePlayerState(PlayerState state) {
    _state = state;
    _playlist.add(PlayerInfo(state: _state, playlist: _podcasts));
  }

  void dispose() {
    _playlist.close();
    _playingController.close();
    _playerStateController.close();
  }
}

class PlayerProvider extends InheritedWidget {
  final PlayerBloc bloc;

  PlayerProvider({
    Key key,
    PlayerBloc bloc,
    Widget child,
  })  : bloc = bloc ?? PlayerBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PlayerBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(PlayerProvider) as PlayerProvider)
          .bloc;
}
