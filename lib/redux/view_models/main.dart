import 'package:redux/redux.dart';
import 'package:moonfm/redux/states/main.dart';

abstract class ViewModel {
  final Store<ReduxState> store;
  ViewModel(this.store);
}
