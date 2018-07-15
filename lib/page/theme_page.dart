import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfm/config/App.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/widgets/play_bar_widget.dart';

class ThemePage extends StatelessWidget {
  ThemePage();

  @override
  Widget build(BuildContext context) {
    final player = PlayerProvider.of(context);
    SystemChrome.setSystemUIOverlayStyle(AppTheme.bloc.systemUiOverlayStyle);
    return Scaffold(
      body: StreamBuilder<PlayerInfo>(
        stream: player.playlist,
        initialData: PlayerInfo(state: PlayerState.normal, playlist: []),
        builder: (context, snapshot) {
          final List<Widget> children = [
            PlayBarWidget(
              isPlaying: (snapshot.data?.state ?? PlayerState.normal) ==
                  PlayerState.playing,
            ),
          ];

          children.addAll(snapshot.data.playlist
              .map((f) => ListTile(title: Text(f.subtitle))));

          return Column(children: children);
        },
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          // player.stateUpdater.add(PlayerState.playing);
          player.podcasts.add(Mock.home.first);
        },
      ),
    );
  }
}
