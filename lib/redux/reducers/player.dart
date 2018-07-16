import 'package:moonfm/redux/actions/main.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/states/player.dart';

PlayerState reducer(ReduxState state, ActionType action) {
  final PlayerState player = state.player;

  switch (action.type) {
    case ReduxActions.addToList:
      return player.copyWith(playlist: player.playlist..add(action.payload));
    case ReduxActions.updateDuration:
      return player.copyWith(duration: player.duration + action.payload);
    case ReduxActions.playNow:
      return player.copyWith(playing: action.payload);
    default:
      return player;
  }
}
