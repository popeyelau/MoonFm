import 'package:flutter/material.dart';

class PlayerSliderWidget extends StatelessWidget {
  final int played;
  final int duraton;
  final double value;

  PlayerSliderWidget({
    this.value,
    this.played,
    this.duraton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Slider(
              onChanged: (double value) {},
              min: 0.0,
              max: 1.0,
              value: value ?? 0.0,
              activeColor: Colors.blueGrey[600],
              inactiveColor: Colors.white70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(durationFomat(played)),
                Text(durationFomat(duraton)),
              ],
            ),
          )
        ],
      ),
    );
  }

  String durationFomat(int seconds) {
    if (seconds == null) return "00:00";

    int hour = (seconds / 3600).floor();
    int min = (seconds / 60).floor() % 60;
    int sec = seconds % 60;

    if (hour > 0) {
      return "${hour < 10 ? "0$hour" : "$hour"}:${min < 10 ? "0$min" : "$min"}:${sec < 10 ? "0$sec" : "$sec"}";
    }
    return "${min < 10 ? "0$min" : "$min"}:${sec < 10 ? "0$sec" : "$sec"}";
  }
}
