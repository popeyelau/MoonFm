import 'package:moonfm/redux/actions/main.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/states/player.dart';

PlayerState reducer(ReduxState state, ActionType action) {
  final PlayerState player = state.player;

  switch (action.type) {
    case ReduxActions.addToList:
      return player.copyWith(playlist: player.playlist..add(action.payload));
      break;
    case ReduxActions.updateDuration:
      return player.copyWith(duration: player.duration + action.payload);
      break;
    default:
      return player;
  }
}
