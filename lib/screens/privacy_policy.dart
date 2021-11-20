import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  final VoidCallback openDrawer;

  const PrivacyPolicy({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('PrivacyPolicy'),
      ),
    );
  }
}
