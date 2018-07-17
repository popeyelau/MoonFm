import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/reducers/player.dart' as player;
import 'package:moonfm/redux/reducers/home.dart' as home;
import 'package:moonfm/redux/reducers/app.dart' as app;

ReduxState reduxReducer(ReduxState state, action) => ReduxState(
    player: player.reducer(state, action),
    home: home.reducer(state, action),
    app: app.reducer(state, action));
