abstract class ActionType {
  String get type;
  final dynamic payload = "";

  String toString() {
    return '$runtimeType(${payload.toString()})';
  }
}

class VoidAction extends ActionType {
  final String type = "__voidAction__";
}

class ReduxActions {
  // Player Page
  static const String addToList = "__addToList__";
  static const String updateDuration = "__updateDuration__";
  static const String updatePlayedDuration = "__updatePlayedDuration__";
  static const String playNow = "__playNow__";
  static const String playNext = "__playNext__";
  static const String updatePlayerState = "__updatePlayerState__";

  // Home Page
  static const String addToDownload = "__addToDownload__";
  static const String addToFavorite = "__addToFavorite__";
  static const String updateTheme = "__updateTheme__";
}
