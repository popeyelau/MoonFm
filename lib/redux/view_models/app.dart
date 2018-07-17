import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/view_models/main.dart';
import 'package:redux/redux.dart';

class AppViewModel extends ViewModel {
  AppViewModel(Store<ReduxState> store) : super(store);

  bool get isPlaying => true;
  List<PodcastItem> get downloads => this.store.state.app.downloads;
  List<PodcastItem> get favourites => this.store.state.app.favourites;
  Themes get theme => this.store.state.app.theme;
  bool get isDarkMode => this.store.state.app.theme == Themes.dark;
}
