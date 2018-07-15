import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moonfm/widgets/size_change_notifier.dart';

class FXRightSideButton extends Object {
  FXRightSideButton(
      {@required this.icon,
      @required this.onPress,
      this.iconColor: Colors.white}) {
    assert(icon != null);
    assert(onPress != null);
  }

  final IconData icon;
  final VoidCallback onPress;
  final Color iconColor;
}

class FXLeftSlide extends StatefulWidget {
  FXLeftSlide(
      {Key key,
      @required this.buttons,
      @required this.child,
      this.backgroundColor: Colors.white})
      : super(key: key) {
    assert(buttons.length <= 3);
  }

  final List<FXRightSideButton> buttons;
  final Widget child;
  final Color backgroundColor;

  @override
  State<StatefulWidget> createState() {
    return new _LeftSlideState();
  }
}

class _LeftSlideState extends State<FXLeftSlide> {
  ScrollController controller = new ScrollController();
  bool isOpen = false;

  Size childSize;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool _handleScrollNotification(dynamic notification) {
    // print(notification);
    if (notification is ScrollEndNotification) {
      if (notification.metrics.pixels >= (widget.buttons.length * 60.0) / 2 &&
          notification.metrics.pixels < widget.buttons.length * 60.0) {
        scheduleMicrotask(() {
          controller.animateTo(widget.buttons.length * 60.0,
              duration: new Duration(milliseconds: 500),
              curve: Curves.decelerate);
        });
      } else if (notification.metrics.pixels > 0.0 &&
          notification.metrics.pixels < (widget.buttons.length * 60.0) / 2) {
        scheduleMicrotask(() {
          controller.animateTo(0.0,
              duration: new Duration(milliseconds: 500),
              curve: Curves.decelerate);
        });
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (childSize == null) {
      return new NotificationListener(
        child: new FXSizeChangedLayoutNotifier(
          child: widget.child,
        ),
        onNotification: (FXSizeChangedLayoutNotification notification) {
          childSize = notification.newSize;
          // print(notification.newSize);
          scheduleMicrotask(() {
            setState(() {});
          });
        },
      );
    }

    List<Widget> above = <Widget>[
      new Container(
        width: childSize.width,
        height: childSize.height,
        color: widget.backgroundColor,
        child: widget.child,
      ),
    ];
    List<Widget> under = <Widget>[];

    for (FXRightSideButton button in widget.buttons) {
      under.add(new Container(
          alignment: Alignment.center,
          width: 60.0,
          height: childSize.height,
          child: new Icon(
            button.icon,
            color: button.iconColor,
          )));

      above.add(new InkWell(
          child: new Container(
            alignment: Alignment.center,
            width: 60.0,
            height: childSize.height,
          ),
          onTap: () {
            controller.jumpTo(0.0);
            button.onPress();
          }));
    }

    Widget buttons = new Container(
      width: childSize.width,
      height: childSize.height,
      color: widget.backgroundColor,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: under,
      ),
    );

    Widget scrollview = new NotificationListener(
      child: new ListView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: above,
      ),
      onNotification: _handleScrollNotification,
    );

    return new Stack(
      children: <Widget>[
        buttons,
        new Positioned(
          child: scrollview,
          left: 0.0,
          bottom: 0.0,
          right: 0.0,
          top: 0.0,
        )
      ],
    );
  }
}
