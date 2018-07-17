import 'package:flutter/foundation.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/PodcastItem.dart';

@immutable
class AppState {
  final List<PodcastItem> downloads;
  final List<PodcastItem> favourites;
  final Themes theme;


  AppState({this.downloads, this.favourites, this.theme});

  AppState copyWith(
      {List<PodcastItem> downloads, List<PodcastItem> favourites, Themes theme}) {
    return AppState(
        downloads: downloads ?? this.downloads,
        favourites: favourites ?? this.favourites,
        theme: theme ?? this.theme);
  }

  AppState.initialState()
      : downloads = [],
        favourites = [],
        theme = Themes.light;
}
