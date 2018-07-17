import 'package:moonfm/redux/actions/main.dart';
import 'package:moonfm/redux/states/app.dart';
import 'package:moonfm/redux/states/main.dart';

AppState reducer(ReduxState state, ActionType action) {
  final AppState app = state.app;

  switch (action.type) {
    case ReduxActions.addToFavorite:
      return app.copyWith(
          favourites: []
            ..addAll(app.favourites)
            ..add(action.payload));
    case ReduxActions.addToDownload:
      return app.copyWith(
          downloads: []
            ..addAll(app.downloads)
            ..add(action.payload));
    case ReduxActions.updateTheme:
      return app.copyWith(theme: action.payload);
      break;
    default:
      return app;
  }
}
