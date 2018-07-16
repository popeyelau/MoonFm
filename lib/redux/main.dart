import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/states/player.dart';
import 'package:redux/redux.dart';
import 'package:moonfm/redux/reducers/main.dart';

Store reduxStore() => Store<ReduxState>(reduxReducer,
    initialState: ReduxState(player: PlayerState.initialState()));
