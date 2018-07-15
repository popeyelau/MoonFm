import 'package:flutter/material.dart';
import 'package:moonfm/config/App.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/page/login_page.dart';
import 'package:moonfm/page/playing_page.dart';
import 'package:moonfm/page/podcast_list_page.dart';
import 'package:moonfm/page/search_page.dart';
import 'package:moonfm/page/settings_page.dart';
import 'package:moonfm/page/tabs_page.dart';
import 'package:moonfm/page/theme_page.dart';

void main() {
  final playerBloc = PlayerBloc();
  runApp(new MyApp(
    playerBloc: playerBloc,
  ));
}

class MyApp extends StatelessWidget {
  final PlayerBloc playerBloc;
  MyApp({this.playerBloc});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Themes>(
      stream: AppTheme.bloc.themeStream,
      initialData: Themes.light,
      builder: (context, snapshot) {
        return PlayerProvider(
          playerBloc: playerBloc,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.buildThemeData(theme: snapshot.data),
            routes: <String, WidgetBuilder>{
              '/': (BuildContext context) => LoginPage(),
              '/list': (BuildContext context) => PodcastListPage(),
              '/home': (BuildContext context) => TabsPage(),
              '/theme': (BuildContext context) => ThemePage(),
              '/settings': (BuildContext context) => SettingsPage(),
              "/search": (BuildContext context) => SearchPage(),
              "/play": (BuildContext context) => PlayingPage()
            },
          ),
        );
      },
    );
  }
}
