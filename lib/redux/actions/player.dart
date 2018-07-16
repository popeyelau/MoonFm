import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/redux/actions/main.dart';

class AddToList extends ActionType {
  String get type => ReduxActions.addToList;
  final PodcastItem payload;
  AddToList({this.payload});
}

class UpdateDuration extends ActionType {
  String get type => ReduxActions.updateDuration;
  final int payload;
  UpdateDuration({this.payload});
}

class PlayNow extends ActionType {
  String get type => ReduxActions.playNow;
  final PodcastItem payload;
  PlayNow({this.payload});
}
