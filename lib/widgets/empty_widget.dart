import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String description;
  EmptyWidget({this.description = "No Data"});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.code,
              color: Colors.grey,
              size: 64.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
