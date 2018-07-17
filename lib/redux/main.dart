import 'package:moonfm/redux/states/app.dart';
import 'package:moonfm/redux/states/home.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/states/player.dart';
import 'package:redux/redux.dart';
import 'package:moonfm/redux/reducers/main.dart';

class StoreContainer {
  static final Store<ReduxState> global = reduxStore();
}

Store reduxStore() => Store<ReduxState>(reduxReducer,
    initialState: ReduxState(
        player: PlayerState.initialState(),
        home: HomeState.initialState(),
        app: AppState.initialState()));
