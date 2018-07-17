import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/ProfileRow.dart';
import 'package:moonfm/widgets/floating_indicator.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.title,
          ),
          elevation: 0.0,
        ),
        body: Container(
          child: ListView(
            children: Mock.profileSections
                .map((i) => _buildSection(items: i))
                .toList(),
          ),
        ),
        floatingActionButton:
            FloatingIndicator() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void _handleOnTap({BuildContext context, String title}) {
    switch (title) {
      case "Settings":
        Navigator.of(context).pushNamed("/settings");
        break;
      default:
        break;
    }
  }

  Widget _buildSection({List<ProfileRow> items}) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        elevation: 0.0,
        // color: Colors.white,
        child: Column(
          children: items.map((i) {
            if (i.title == "Logout") {
              return GestureDetector(
                onTap: () => _handleOnTap(context: context, title: i.title),
                child: ListTile(
                  key: Key(i.title),
                  contentPadding: EdgeInsets.only(left: 0.0),
                  leading: FlatButton(
                    child: Text(
                      i.title,
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {},
                  ),
                ),
              );
            }
            final index = items.indexOf(i);
            return GestureDetector(
              onTap: () => _handleOnTap(context: context, title: i.title),
              child: Container(
                color: index == 1
                    ? Theme.of(context).canvasColor
                    : Theme.of(context).cardColor,
                child: ListTile(
                  leading: Icon(
                    i.icon,
                    size: 26.0,
                    color: i.iconColor,
                  ),
                  title: Text(
                    i.title,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
