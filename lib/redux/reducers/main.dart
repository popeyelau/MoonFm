import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/reducers/player.dart' as player;

ReduxState reduxReducer(ReduxState state, action) =>
    ReduxState(player: player.reducer(state, action));
