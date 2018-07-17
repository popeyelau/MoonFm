import 'package:flutter/material.dart';
import 'package:moonfm/models/Mock.dart';
import 'package:moonfm/redux/states/main.dart';
import 'package:moonfm/redux/view_models/player.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:moonfm/widgets/appbar.dart';
import 'package:redux/redux.dart';

class ReduxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReduxState, PlayerViewModel>(
      converter: (Store<ReduxState> store) => PlayerViewModel(store),
      builder: (BuildContext context, PlayerViewModel vm) {
        return Scaffold(
          appBar: customAppBar(context),
          body: Column(
            children: <Widget>[
              Text("Duration: ${vm.duration}"),
              ListView.builder(
                itemExtent: 48.0,
                itemCount: vm.playlist.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(vm.playlist[index].title));
                },
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => vm.addToList(Mock.playlist.first)),
        );
      },
    );
  }
}
