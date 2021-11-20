import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final List<IconData> icons;
  final int currentIndex;
  final Function(int index) onItemTap;

  const CustomBottomNavigation(
      {Key? key,
      required this.icons,
      required this.currentIndex,
      required this.onItemTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = [];
    for (int i = 0; i < icons.length; i++) {
      _items.add(_itemWidget(i, icons[i], currentIndex == i));
    }

    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 50,
      child: Row(
        children: _items,
      ),
    );
  }

  Widget _itemWidget(int index, IconData iconData, bool selected) {
    return Expanded(
        child: InkWell(
      onTap: () {
        onItemTap(index);
      },
      child: Icon(
        iconData,
        color: selected ? Colors.blue : Colors.grey,
      ),
    ));
  }
}
