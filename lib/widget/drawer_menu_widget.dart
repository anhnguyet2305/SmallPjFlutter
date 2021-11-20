import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const DrawerMenuWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onClicked,
        icon: Icon(Icons.format_align_left),
        color: Colors.black,
      );
}
