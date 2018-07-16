import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/page/login_page.dart';
import 'package:moonfm/page/player_page.dart';
import 'package:moonfm/page/podcast_list_page.dart';
import 'package:moonfm/page/redux_page.dart';
import 'package:moonfm/page/search_page.dart';
import 'package:moonfm/page/settings_page.dart';
import 'package:moonfm/page/tabs_page.dart';
import 'package:moonfm/redux/main.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<ReduxState> store = reduxStore();
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.buildThemeData(theme: Themes.light),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => ReduxPage(),
          '/login': (BuildContext context) => LoginPage(),
          '/list': (BuildContext context) => PodcastListPage(),
          '/home': (BuildContext context) => TabsPage(),
          '/settings': (BuildContext context) => SettingsPage(),
          "/search": (BuildContext context) => SearchPage(),
          "/play": (BuildContext context) => PlayerPage()
        },
      ),
    );

    /*
    return StreamBuilder<Themes>(
      stream: AppTheme.bloc.themeStream,
      initialData: Themes.light,
      builder: (context, snapshot) {
        return PlayerProvider(
          bloc: bloc,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.buildThemeData(theme: snapshot.data),
            routes: <String, WidgetBuilder>{
              '/': (BuildContext context) => ReduxPage(),
              '/login': (BuildContext context) => LoginPage(),
              '/list': (BuildContext context) => PodcastListPage(),
              '/home': (BuildContext context) => TabsPage(),
              '/settings': (BuildContext context) => SettingsPage(),
              "/search": (BuildContext context) => SearchPage(),
              "/play": (BuildContext context) => PlayingPage()
            },
          ),
        );
      },
    );*/
  }
}
