import 'package:flutter/foundation.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/PodcastItem.dart';

@immutable
class HomeState {
  final List<PodcastItem> podcasts;
  final String fetchState;

  HomeState({this.podcasts, this.fetchState});

  HomeState copyWith({List<PodcastItem> podcasts, String fetchState}) {
    return HomeState(
        podcasts: podcasts ?? this.podcasts,
        fetchState: fetchState ?? this.fetchState);
  }

  HomeState.initialState()
      : podcasts = Mock.home,
        fetchState = "Last Updated an hour ago.";
}
