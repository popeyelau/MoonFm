import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/page/search_result_page.dart';
import 'package:moonfm/widgets/search_bar_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() {
    return new SearchPageState();
  }
}

class SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: .0,
          title: Text(
            "Search",
            style: Theme.of(context).textTheme.title,
          ),
          iconTheme: Theme.of(context).iconTheme),
      body: Container(
        child: Column(
          children: <Widget>[
            SearchBarWidget(),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Material(
                        // color: Colors.white,
                        child: TabBar(
                          controller: controller,
                          labelColor: Theme.of(context).textTheme.body1.color,
                          // indicatorColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: <Widget>[
                            Tab(
                              text: "PODCAST",
                            ),
                            Tab(
                              text: "EPOISODE",
                            ),
                            Tab(
                              text: "RADIO",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: controller,
                        children: <Widget>[
                          SearchResultPage(),
                          SearchResultPage(),
                          SearchResultPage()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
