import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfm/config/AppColors.dart';

class AppTheme {
  static ThemeData buildThemeData({Themes theme}) {
    final isDark = theme != Themes.light;

    final baseTheme = ThemeData(
      brightness: theme == Themes.light ? Brightness.light : Brightness.dark,
      primaryColor: kPrimaryColor,
      primaryColorDark: kPrimaryDark,
      primaryColorLight: kPrimaryLight,
      accentColor: kSecondaryColor,
      bottomAppBarColor: kSecondaryDark,
      buttonColor: kSecondaryColor,
    );

    final dividerColor = isDark ? Colors.white30 : Colors.grey[300];
    final indicatorColor = isDark ? Colors.white70 : Colors.black54;
    final scaffoldBackgroundColor =
        isDark ? Color(0xff101010) : Colors.grey[100];
    final backgroundColor = isDark ? Color(0xff101010) : Colors.white;
    final iconColor = isDark ? Colors.white : Colors.black;
    final textColor = isDark ? Colors.grey[50] : Colors.black87;
    final captionColor = isDark ? Colors.grey[50] : Colors.black54;
    final titleColor = isDark ? Colors.grey[200] : Colors.black.withAlpha(160);
    final cardColor = isDark ? Color(0xff202020).withAlpha(50) : Colors.white;
    final canvasColor = isDark ? backgroundColor : Colors.grey[50];

    return baseTheme.copyWith(
        cardColor: cardColor,
        canvasColor: canvasColor,
        dividerColor: dividerColor,
        indicatorColor: indicatorColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        backgroundColor: backgroundColor,
        dialogBackgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: iconColor),
        textTheme: TextTheme(
          title: TextStyle(fontSize: 18.0, color: titleColor),
          body1: TextStyle(fontSize: 14.0, color: textColor),
          body2: TextStyle(fontSize: 11.0, color: captionColor),

          subhead:
              TextStyle(fontSize: 14.0, color: textColor), // ListTile title
          caption: TextStyle(
              fontSize: 13.0, color: captionColor), // ListTile subTitle
        ),
        accentTextTheme: TextTheme(
          body1: TextStyle(
              fontSize: 12.0, color: textColor, fontWeight: FontWeight.bold),
          body2: TextStyle(
              fontSize: 14.0, color: textColor, fontWeight: FontWeight.w500),
        ));
  }
}

enum Themes {
  light,
  dark,
  darkBlue,
}
