import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/page/downloads_page.dart';
import 'package:moonfm/page/login_page.dart';
import 'package:moonfm/page/player_page.dart';
import 'package:moonfm/page/podcast_info_page.dart';
import 'package:moonfm/page/podcast_list_page.dart';
import 'package:moonfm/page/redux_page.dart';
import 'package:moonfm/page/search_page.dart';
import 'package:moonfm/page/settings_page.dart';
import 'package:moonfm/page/tabs_page.dart';
import 'package:moonfm/redux/main.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/view_models/app.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<ReduxState> store = StoreContainer.global;
  runApp(new MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<ReduxState> store;
  MyApp({this.store});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StoreProvider<ReduxState>(
        store: store,
        child: StoreConnector<ReduxState, AppViewModel>(
          converter: (Store<ReduxState> store) => AppViewModel(store),
          builder: (BuildContext context, AppViewModel vm) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.buildThemeData(theme: vm.theme),
              routes: <String, WidgetBuilder>{
                '/': (BuildContext context) => LoginPage(),
                '/demo': (BuildContext context) => ReduxPage(),
                '/home': (BuildContext context) => TabsPage(),
                '/settings': (BuildContext context) => SettingsPage(),
                "/search": (BuildContext context) => SearchPage(),
                "/play": (BuildContext context) => PlayerPage(),
                "/downloads": (BuildContext context) => DownloadsPage(),
                "/subscriptions": (BuildContext context) =>
                    PodcastListPage(title: "Subscriptions"),
                "/favorites": (BuildContext context) =>
                    PodcastListPage(title: "Favorites"),
                "/history": (BuildContext context) =>
                    PodcastListPage(title: "History"),
                "/info": (BuildContext context) => PodcastInfoPage(),
              },
            );
          },
        ));
  }
}
