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
  static const String addToList = "__addToList__";
  static const String updateDuration = "__updateDuration__";
}
