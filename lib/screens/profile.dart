import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/components/box_button.dart';
import 'package:food/components/card_page.dart';
import 'package:food/widget/drawer_menu_widget.dart';
import 'package:hexcolor/hexcolor.dart';

var styleTextCard = TextStyle(fontSize: 16.0, color: Colors.grey);

class ProfileScreen extends StatelessWidget {
  final VoidCallback openDrawer;

  const ProfileScreen({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('My profile'),
        leading: Container(
          margin: EdgeInsets.only(left: 18.0),
          child: DrawerMenuWidget(onClicked: openDrawer),
        ),
      ),
      backgroundColor: HexColor('#F2F2F2'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Card(
                  shadowColor: HexColor('#000000'),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            ('assets/images/img_5.png'),
                            height: 150.0,
                            width: 100.0,
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Marvis Ighedosa',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.create),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 4.0),
                              height: 1,
                              color: Colors.grey,
                            ),
                            Text(
                              'abvasc@gmail.com',
                              style: styleTextCard,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
                              height: 1,
                              color: Colors.grey,
                            ),
                            Text(
                              '+234 9011039271',
                              style: styleTextCard,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
                              height: 1,
                              color: Colors.grey,
                            ),
                            Text(
                              'No 15 uti street off ovie palace road effurun delta state',
                              style: styleTextCard,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                CardClicked(
                  titleButton: 'Orders',
                  onTap: () {},
                ),
                CardClicked(
                  titleButton: 'Pending reviews',
                  onTap: () {},
                ),
                CardClicked(
                  titleButton: 'Faq',
                  onTap: () {},
                ),
                CardClicked(
                  titleButton: 'Help',
                  onTap: () {},
                ),
                Button(onPressed: () {}, buttonTitle: 'Update')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
