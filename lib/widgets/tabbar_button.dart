import 'package:flutter/material.dart';

class TabBarButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;
  TabBarButton({this.text, this.icon, this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(icon,
              // color: selected ? Colors.pink : Colors.grey[400],
              color: selected
                  ? Theme.of(context).accentColor
                  : Theme.of(context).primaryColorDark),
          Text(
            text,
            style: TextStyle(
                fontSize: 11.0,
                color: selected
                    ? Theme.of(context).accentColor
                    : Theme.of(context).primaryColorDark),
          )
        ],
      ),
    );
  }
}
