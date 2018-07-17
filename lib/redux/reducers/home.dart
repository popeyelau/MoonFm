import 'package:moonfm/redux/actions/main.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/states/home.dart';

HomeState reducer(ReduxState state, ActionType action) {
  final HomeState home = state.home;

  switch (action.type) {
    default:
      return home;
  }
}
