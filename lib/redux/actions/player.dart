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

class UpdatePlayedDuration extends ActionType {
  String get type => ReduxActions.updatePlayedDuration;
  final int payload;
  UpdatePlayedDuration({this.payload});
}

class PlayNow extends ActionType {
  String get type => ReduxActions.playNow;
  final PodcastItem payload;
  PlayNow({this.payload});
}

class PlayNext extends ActionType {
  String get type => ReduxActions.playNext;
  final PodcastItem payload;
  PlayNext({this.payload});
}

class UpdatePlayerState extends ActionType {
  String get type => ReduxActions.updatePlayerState;
  final bool payload;
  UpdatePlayerState({this.payload});
}

