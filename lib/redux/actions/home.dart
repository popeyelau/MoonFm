import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/redux/actions/main.dart';

class AddToDownload extends ActionType {
  String get type => ReduxActions.addToDownload;
  final PodcastItem payload;
  AddToDownload({this.payload});
}

class AddToFavorite extends ActionType {
  String get type => ReduxActions.addToFavorite;
  final PodcastItem payload;
  AddToFavorite({this.payload});
}

class UpdateTheme extends ActionType {
  String get type => ReduxActions.updateTheme;
  final Themes payload;
  UpdateTheme({this.payload});
}
