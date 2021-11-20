import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CardClicked extends StatelessWidget {
  const CardClicked({Key? key, required this.onTap, required this.titleButton})
      : super(key: key);

  final Function onTap;
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Card(
          shadowColor: HexColor('#000000'),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titleButton,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                const Icon(
                  Icons.chevron_right,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
