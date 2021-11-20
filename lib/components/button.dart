import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ExpandedButton extends StatelessWidget {
  final Function onPressed;
  final String buttonTitle;

  const ExpandedButton({required this.onPressed, required this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      padding: const EdgeInsets.all(20.0),
      alignment: Alignment.bottomCenter,
      child: Expanded(
        child: TextButton(
          onPressed: () {
            onPressed();
          },
          style: TextButton.styleFrom(
            backgroundColor: HexColor('#FA4A0C'),
            // padding: const EdgeInsets.symmetric(
            //     vertical: 14.0, horizontal: 122.0),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
