import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5.0)),
        height: 44.0,
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: Colors.white))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                ),
                suffixIcon: Icon(
                  Icons.clear,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
