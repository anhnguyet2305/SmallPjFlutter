import 'package:flutter/material.dart';

import 'package:food/components/bottom_navaigation.dart';
import 'package:food/screens/body_home.dart';
import 'package:food/data/drawer_items.dart';
import 'package:food/model/drawer_item.dart';
import 'package:food/screens/offer_and_promo.dart';
import 'package:food/screens/orders.dart';
import 'package:food/screens/privacy_policy.dart';
import 'package:food/screens/profile.dart';
import 'package:food/screens/security.dart';
import 'package:food/widget/drawer_widget.dart';
import 'package:hexcolor/hexcolor.dart';

class ContainerDrawerScreen extends StatefulWidget {
  const ContainerDrawerScreen({Key? key}) : super(key: key);

  @override
  _ContainerDrawerScreenState createState() => _ContainerDrawerScreenState();
}

class _ContainerDrawerScreenState extends State<ContainerDrawerScreen> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.home; // **
  bool isDragging = false;

  @override
  void initState() {
    super.initState();
    closeDrawer();
  }

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  void openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 150;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FA4A0C'),
      body: Stack(
        children: [
          buildDrawer(),
          buildPage(),
        ],
      ),
    );
  }

  Widget buildDrawer() => SafeArea(
        child: SizedBox(
          width: xOffset,
          child: DrawerWidget(
            onSelectedItem: (item) {
              switch (item) {
                default:
                  setState(() => this.item = item);
                  closeDrawer();
              }
            },
          ),
        ),
      );
  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          duration: Duration(milliseconds: 250),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                (isDrawerOpen ? 40 : 0),
              ),
              child: Container(
                color: isDrawerOpen
                    ? Colors.white12
                    : Theme.of(context).primaryColor,
                child: BottomNavigation(
                  openDrawer: openDrawer,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.home:
        return ContentHome(openDrawer: openDrawer);

      case DrawerItems.orders:
        return Orders(openDrawer: openDrawer);

      case DrawerItems.offer_and_promo:
        return OfferAndPromo(openDrawer: openDrawer);

      case DrawerItems.profile:
        return ProfileScreen(openDrawer: openDrawer);

      case DrawerItems.privacy_policy:
        return PrivacyPolicy(openDrawer: openDrawer);

      case DrawerItems.security:
        return Security(openDrawer: openDrawer);

      default:
        return ContentHome(openDrawer: openDrawer);
    }
  }
}
