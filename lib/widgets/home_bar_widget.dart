import 'package:flutter/material.dart';
import 'package:moonfm/models/Mock.dart';

class HomeBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: Mock.homeBanners.map((i) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(i.route);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5)),
                margin: EdgeInsets.all(8.0),
                elevation: 0.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 10.0),
                      child: Icon(
                        i.icon,
                        color: i.iconColor,
                        size: 28.0,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      i.title,
                    ))
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
