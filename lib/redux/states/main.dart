import 'package:flutter/foundation.dart';
import 'package:moonfm/redux/states/app.dart';
import 'package:moonfm/redux/states/home.dart';
import 'package:moonfm/redux/states/player.dart';

@immutable
class ReduxState {
  final PlayerState player;
  final HomeState home;
  final AppState app;

  const ReduxState({this.player, this.home, this.app});
}
