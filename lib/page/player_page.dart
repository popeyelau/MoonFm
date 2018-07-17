import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:moonfm/config/App.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:moonfm/redux/actions/player.dart';
import 'package:moonfm/redux/main.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/view_models/player.dart';
import 'package:moonfm/widgets/cover_widget.dart';
import 'package:moonfm/widgets/play_bar_widget.dart';
import 'package:moonfm/widgets/player_list_widget.dart';
import 'package:moonfm/widgets/player_slider_widget.dart';
import 'package:redux/redux.dart';

class PlayerPage extends StatefulWidget {
  PlayerPage();

  @override
  PlayerPageState createState() {
    return new PlayerPageState();
  }
}

class PlayerPageState extends State<PlayerPage> {
  AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = Applicaton.audioPlayer;
    audioPlayer.durationHandler = (Duration d) {
      StoreContainer.global.dispatch(UpdateDuration(payload: d.inSeconds));
    };
    audioPlayer.positionHandler = (Duration d) {
      StoreContainer.global
          .dispatch(UpdatePlayedDuration(payload: d.inSeconds));
    };
    audioPlayer.completionHandler = () {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.lightBlue),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: StoreConnector<ReduxState, PlayerViewModel>(
            converter: (Store<ReduxState> store) => PlayerViewModel(store),
            builder: (BuildContext context, PlayerViewModel vm) {
              return ListView(
                children: <Widget>[
                  CoverWidget(
                    title: vm.playing.subtitle,
                    cover: vm.playing.cover,
                  ),
                  PlayerSliderWidget(
                      value: vm.progress,
                      duraton: vm.duration,
                      played: vm.playedDuration),
                  SizedBox(
                    height: 16.0,
                  ),
                  PlayBarWidget(
                    playing: vm.playing,
                    showCover: false,
                    onPlay: (PodcastItem item) =>
                        onPlay(item: item, isPlaying: vm.isPlaying),
                    onNext: onNext,
                    onRewind: onRewind,
                    isPlaying: vm.isPlaying,
                  ),
                  PlaylistWidget(
                    playlist: vm.playlist,
                  ),
                ],
              );
            },
          ),
        ));
  }

  @override
  void dispose() {
    Applicaton.audioPlayer.durationHandler = null;
    Applicaton.audioPlayer.positionHandler = null;
    Applicaton.audioPlayer.completionHandler = null;
    super.dispose();
  }

  void onPlay({PodcastItem item, bool isPlaying}) async {
    if (isPlaying) {
      await audioPlayer.pause();
      StoreContainer.global.dispatch(UpdatePlayerState(payload: false));
      return;
    }

    await audioPlayer.play(item.audioUrl);
  }

  void onNext() async {}

  void onRewind() async {}

  void seekTo(double value) async {}
}
