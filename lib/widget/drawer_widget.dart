import 'package:flutter/material.dart';
import 'package:food/data/drawer_items.dart';
import 'package:food/model/drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;

  const DrawerWidget({Key? key, required this.onSelectedItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            buildDrawerItems(context),
            ListTile(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logging out!'),
                  ),
                );
              },
              leading: const Icon(
                Icons.input,
                color: Colors.white,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) => Column(
        children: DrawerItems.all
            .map(
              (item) => ListTile(
                onTap: () => onSelectedItem(item),
                leading: Icon(
                  item.icon,
                  color: Colors.white,
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
            .toList(),
      );
}
