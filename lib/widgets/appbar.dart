import 'package:flutter/material.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/redux/main.dart';

AppBar customAppBar(BuildContext context,
        {String title, List<Widget> actions, PreferredSizeWidget bottom}) =>
    AppBar(
      brightness: StoreContainer.global.state.app.theme == Themes.light
          ? Brightness.light
          : Brightness.dark,
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: false,
      backgroundColor: Theme.of(context).backgroundColor,
      title: title == null
          ? null
          : Text(
              title,
              style: Theme.of(context).textTheme.title,
            ),
      actions: actions,
      elevation: 0.0,
      bottom: bottom,
    );
