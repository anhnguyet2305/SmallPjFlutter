import 'package:flutter/material.dart';
import 'package:food/model/drawer_item.dart';

class DrawerItems {
  static const home = DrawerItem(title: "Home", icon: Icons.home);
  static const profile =
      DrawerItem(title: "Profile", icon: Icons.account_circle);
  static const orders = DrawerItem(title: "Orders", icon: Icons.shopping_cart);
  static const offer_and_promo =
      DrawerItem(title: "Offer and promo", icon: Icons.loyalty);
  static const privacy_policy =
      DrawerItem(title: "Privacy policy", icon: Icons.assignment);
  static const security = DrawerItem(title: "Security", icon: Icons.security);
  static final List<DrawerItem> all = [
    home,
    profile,
    orders,
    offer_and_promo,
    privacy_policy,
    security,
  ];
}
