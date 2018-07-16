import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/view_models/main.dart';
import 'package:redux/redux.dart';

class PlayerViewModel extends ViewModel {
  PlayerViewModel(Store<ReduxState> store) : super(store);

  List<PodcastItem> get playlist {
    return this.store.state.player.playlist;
  }

  int get duration {
    return this.store.state.player.duration;
  }
}
