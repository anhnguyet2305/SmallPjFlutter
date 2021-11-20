import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String buttonTitle;

  const Button({required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 66,
      child: RaisedButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        color: Colors.deepOrange,
        child: Text(
          buttonTitle,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
