import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String month;
  final String date;
  DateWidget({this.month, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      height: 50.0,
      width: 60.0,
      child: Card(
        elevation: 0.0,
        margin: EdgeInsets.only(left: 8.0, right: 8.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(month, style: Theme.of(context).textTheme.body2),
            SizedBox(height: 3.0),
            Text(
              date,
              style: Theme.of(context).accentTextTheme.body1,
            )
          ],
        ),
      ),
    );
  }
}
