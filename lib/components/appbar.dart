import 'package:flutter/material.dart';
import 'package:food/widget/drawer_menu_widget.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback openDrawer;
  final String title;
  const MyAppBar({Key? key, required this.openDrawer, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(title),
      leading: Container(
          margin: EdgeInsets.only(left: 18.0),
          child: DrawerMenuWidget(onClicked: openDrawer)),
    );
  }
}
