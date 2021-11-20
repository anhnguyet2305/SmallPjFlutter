import 'package:flutter/material.dart';

class Security extends StatelessWidget {
  final VoidCallback openDrawer;

  const Security({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Security'),
      ),
    );
  }
}
