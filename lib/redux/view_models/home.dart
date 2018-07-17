import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/redux/actions/home.dart';
import 'package:moonfm/redux/actions/player.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/view_models/main.dart';
import 'package:redux/redux.dart';

class HomeViewModel extends ViewModel {
  HomeViewModel(Store<ReduxState> store) : super(store);

  bool get isPlaying => true;
  List<PodcastItem> get podcasts => this.store.state.home.podcasts;

  void addToList(PodcastItem item) => store.dispatch(AddToList(payload: item));
  void addToDownload(PodcastItem item) => store.dispatch(AddToDownload(payload: item));
  void addToFavorite(PodcastItem item) => store.dispatch(AddToFavorite(payload: item));
}
