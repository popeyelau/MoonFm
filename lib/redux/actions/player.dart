import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/redux/actions/main.dart';

class AddToList extends ActionType {
  String get type => ReduxActions.addToList;
  final PodcastItem payload;
  AddToList({this.payload});
}

class UpdateDuration extends ActionType {
  @override
  String get type => ReduxActions.updateDuration;
  final int payload;
  UpdateDuration({this.payload});
}
