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