import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String description;
  EmptyWidget({this.description = "No Data"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.inbox,
              color: Colors.grey,
              size: 44.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
