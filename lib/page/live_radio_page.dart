import 'package:flutter/material.dart';
import 'package:moonfm/models/Mock.dart';

class LiveRadioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        itemCount: Mock.countries.length,
        itemExtent: 48.0,
        itemBuilder: (context, index) {
          final item = Mock.countries[index];
          return Container(
            padding: EdgeInsets.all(8.0),
            color: index.isEven
                ? Theme.of(context).canvasColor
                : Theme.of(context).cardColor,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 8.0,
                ),
                Image.asset(
                  item.imageName,
                  width: 30.0,
                  height: 30.0,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(child: Text(item.title)),
              ],
            ),
          );
        },
      ),
    );
  }
}
