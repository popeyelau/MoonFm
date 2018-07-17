import 'package:moonfm/redux/actions/main.dart';
import 'package:moonfm/redux/actions/player.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/states/player.dart';

PlayerState reducer(ReduxState state, ActionType action) {
  final PlayerState player = state.player;

  switch (action.type) {
    case ReduxActions.addToList:
      return player.copyWith(
          playlist: []
            ..addAll(player.playlist)
            ..add(action.payload));
    case ReduxActions.updateDuration:
      return player.copyWith(duration: action.payload);
    case ReduxActions.updatePlayedDuration:
      return player.copyWith(playedDuration: action.payload, isPlaying: true);
    case ReduxActions.playNow:
      return player.copyWith(playing: action.payload);
    case ReduxActions.updatePlayerState:
      return player.copyWith(isPlaying: action.payload);
    case ReduxActions.playNext:
      return player.copyWith(
          playlist: [action.payload]..addAll(player.playlist));
    default:
      return player;
  }
}
