import 'package:flutter/material.dart';

class FetchStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        elevation: 0.0,
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.wifi_tethering, color: Colors.pink),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Last Updated: an hour ago",
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Jul", style: Theme.of(context).textTheme.body2),
                        SizedBox(height: 3.0),
                        Text(
                          "12",
                          style: Theme.of(context).accentTextTheme.body1,
                        )
                      ],
                    )
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
