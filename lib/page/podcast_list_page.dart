import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/view_models/app.dart';
import 'package:moonfm/widgets/appbar.dart';
import 'package:moonfm/widgets/empty_widget.dart';
import 'package:redux/redux.dart';

class PodcastListPage extends StatelessWidget {
  String title;
  PodcastListPage({this.title});
  final List<PodcastItem> list = Mock.discoverPodcasts;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: customAppBar(
          context,
          title: title,
        ),
        body: StoreConnector<ReduxState, AppViewModel>(
          converter: (Store<ReduxState> store) => AppViewModel(store),
          builder: (BuildContext context, AppViewModel vm) {
            final list = vm.favourites;
            return list.isEmpty
                ? Container(
                    child: EmptyWidget(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return Container(
                        color: index.isEven
                            ? Theme.of(context).canvasColor
                            : Theme.of(context).cardColor,
                        child: ListTile(
                          leading: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(item.cover)),
                              )),
                          title: Text(item.title),
                          subtitle: Text(item.auth),
                        ),
                      );
                    },
                    itemExtent: 64.0,
                    itemCount: list.length,
                  );
          },
        ));
  }
}
