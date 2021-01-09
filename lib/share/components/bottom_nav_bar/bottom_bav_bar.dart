import 'package:flutter/material.dart';

import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Today",
            svgScr: "asset/icons/chat.svg",
          ),
          BottomNavItem(
            title: "Today",
            svgScr: "asset/icons/chat.svg",
          ),
        ]
    ),
    );
  }
}
