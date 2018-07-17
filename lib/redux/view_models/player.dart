import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/redux/actions/player.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/view_models/main.dart';
import 'package:redux/redux.dart';

class PlayerViewModel extends ViewModel {
  PlayerViewModel(Store<ReduxState> store) : super(store);

  PodcastItem get playing => this.store.state.player.playing;
  List<PodcastItem> get playlist => this.store.state.player.playlist;
  int get duration => this.store.state.player.duration;
  int get playedDuration => this.store.state.player.playedDuration;
  double get progress => duration == 0 ? 0.0 : playedDuration / duration;
  bool get isPlaying => this.store.state.player.isPlaying;

  void addToList(PodcastItem item) => store.dispatch(AddToList(payload: item));
}
