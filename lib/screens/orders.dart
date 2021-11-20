import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  final VoidCallback openDrawer;

  const OrdersScreen({Key? key, required this.openDrawer}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('OrdersScreen'),
      ),
    );
  }
}
