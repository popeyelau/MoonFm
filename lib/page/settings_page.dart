import 'package:flutter/material.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/RowItem.dart';
import 'package:moonfm/redux/actions/home.dart';
import 'package:moonfm/redux/main.dart';
import 'package:moonfm/widgets/appbar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, title: "Settings"),
        body: Container(
          child: ListView(
            children: Mock.settings.keys.map((key) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildSection(
                    context: context, title: key, items: Mock.settings[key]),
              );
            }).toList(),
          ),
        ));
  }

  void handleRowOnTap({BuildContext context, String title}) {
    showModalBottomSheet(
        builder: (BuildContext context) {
          return Column(
            children: ["Very White", "Quite Black", "Blue Black"]
                .map((i) => GestureDetector(
                      onTap: () {
                        final theme =
                            i.contains("White") ? Themes.light : Themes.dark;
                        StoreContainer.global
                            .dispatch(UpdateTheme(payload: theme));
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        child: ListTile(
                          title: Text(i),
                        ),
                      ),
                    ))
                .toList(),
          );
        },
        context: context);
  }

  List<Widget> _buildSection(
      {BuildContext context, String title, List<RowItem> items}) {
    final List<Widget> contents = [
      Container(
        child: Container(
          width: double.infinity,
          color: Theme.of(context).cardColor.withAlpha(100),
          padding: EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      )
    ];

    contents.addAll(ListTile.divideTiles(
        color: Theme.of(context).dividerColor,
        tiles: items
            .map((i) => GestureDetector(
                  onTap: () {
                    handleRowOnTap(context: context, title: i.title);
                  },
                  child: Container(
                    color: Theme.of(context).backgroundColor,
                    child: ListTile(
                      leading: i.icon == null
                          ? null
                          : Icon(
                              i.icon,
                              size: 26.0,
                            ),
                      trailing: i.title == "30 seconds"
                          ? Icon(
                              Icons.check,
                              size: 18.0,
                            )
                          : null,
                      title: Text(i.title),
                    ),
                  ),
                ))
            .toList()));
    return contents;
  }
}
