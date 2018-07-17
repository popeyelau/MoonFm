import 'package:flutter/cupertino.dart';

class HomeBar {
  final IconData icon;
  final String title;
  final Color iconColor;
  String get route => "/" + title.toLowerCase();
  HomeBar({this.title, this.icon, this.iconColor});
}
