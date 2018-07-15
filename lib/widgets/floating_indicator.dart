import 'package:flutter/material.dart';
import 'package:moonfm/config/App.dart';
import 'package:moonfm/config/AppTheme.dart';

class FloatingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AppTheme.bloc.isDarkMode;
    final color =
        isDarkMode ? Color(0xff243444) : Theme.of(context).backgroundColor;
    final List<BoxShadow> shadow = isDarkMode
        ? []
        : [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: -1.0,
                offset: Offset(0.2, 1.0))
          ];
    return Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: shadow),
        child: IconButton(
            icon: Icon(
              Icons.wifi_tethering,
              size: 18.0,
              color: Colors.blue,
            ),
            onPressed: () {
              // Applicaton().showPlaying(context);
              Navigator.of(context).pushNamed("/play");
            }));
  }
}
