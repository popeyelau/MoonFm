import 'package:flutter/material.dart';
import 'package:moonfm/page/browse_page.dart';
import 'package:moonfm/page/discover_page.dart';
import 'package:moonfm/page/home_page.dart';
import 'package:moonfm/page/profile_page.dart';
import 'package:moonfm/widgets/tabbar_button.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _TabsPageState createState() => new _TabsPageState();
}

class _TabsPageState extends State<TabsPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(() {
      setState(() {
        _selectedIndex = controller.index;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          HomePage(),
          DiscoverPage(),
          BrowsePage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.pink,
          tabs: <Widget>[
            TabBarButton(
                icon: Icons.wifi_tethering,
                text: "Listen Now",
                selected: _selectedIndex == 0),
            TabBarButton(
                icon: Icons.language,
                text: "Discover",
                selected: _selectedIndex == 1),
            TabBarButton(
                icon: Icons.filter_drama,
                text: "Browse",
                selected: _selectedIndex == 2),
            TabBarButton(
                icon: Icons.person,
                text: "Profile",
                selected: _selectedIndex == 3),
            /*
            Tab(icon: Icon(Icons.playlist_play), text: "Listen Now",),
            Tab(icon: Icon(Icons.language), text: "Discover",),
            Tab(icon: Icon(Icons.filter_list), text: "Browse",),
            Tab(icon: Icon(Icons.person), text: "Profile",),*/
          ],
          controller: controller,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
