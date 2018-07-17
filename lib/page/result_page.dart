import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/view_models/app.dart';
import 'package:moonfm/widgets/empty_widget.dart';
import 'package:redux/redux.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReduxState, AppViewModel>(
      converter: (Store<ReduxState> store) => AppViewModel(store),
      builder: (BuildContext context, AppViewModel vm) {
        final list = vm.downloads;
        return list.isEmpty
            ? Container(
                child: EmptyWidget(),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = list[index];
                  return Container(
                    color: index.isEven
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).cardColor,
                    child: ListTile(
                        key: Key(item.title),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 0.0),
                        title: Text(
                          item.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 12.0),
                        ),
                        subtitle: Text(item.title),
                        leading: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(item.cover)),
                            ))),
                  );
                },
                itemCount: list.length,
              );
      },
    );
  }
}
