import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  final AssetImage img;
  final String name;
  final double price;

  const Food(
      {Key? key, required this.img, required this.name, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipOval(
            child: Container(
              color: Colors.white,
              child: Image(image: img),
            ),
          ),
          Text(name),
          Text(
            price.toString(),
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
