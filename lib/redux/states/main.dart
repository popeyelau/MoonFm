import 'package:flutter/foundation.dart';
import 'package:moonfm/redux/states/player.dart';

@immutable
class ReduxState {
  final PlayerState player;

  const ReduxState({this.player});
}
