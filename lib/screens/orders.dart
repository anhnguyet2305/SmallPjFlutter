import 'package:flutter/material.dart';
import 'package:food/widget/drawer_menu_widget.dart';
import 'package:hexcolor/hexcolor.dart';

class Orders extends StatelessWidget {
  final VoidCallback openDrawer;
  const Orders({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F2F2F2'),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Orders'),
        leading: Container(
            margin: EdgeInsets.only(left: 18.0),
            child: DrawerMenuWidget(onClicked: openDrawer)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Center(
            child: Text('orders'),
          ),
        ),
      ),
    );
  }
}
