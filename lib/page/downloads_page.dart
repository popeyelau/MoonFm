import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfm/config/AppTheme.dart';
import 'package:moonfm/page/result_page.dart';

class DownloadsPage extends StatefulWidget {
  @override
  DownloadsPageState createState() {
    return new DownloadsPageState();
  }
}

class DownloadsPageState extends State<DownloadsPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
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
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: .0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                child: Material(
                  color: Theme.of(context).backgroundColor,
                  child: TabBar(
                    controller: controller,
                    labelColor: Theme.of(context).textTheme.body1.color,
                    // indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(
                          Icons.file_download,
                          color: Colors.blue,
                        ),
                        text: "DOWNLOAD TASKS",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.archive,
                          color: Colors.yellow[800],
                        ),
                        text: "DOWNLOADED",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: <Widget>[
                    ResultPage(),
                    ResultPage(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
