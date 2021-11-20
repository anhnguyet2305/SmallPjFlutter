import 'package:flutter/material.dart';
import 'package:food/components/food.dart';
import 'package:food/screens/food_details.dart';
import 'package:food/screens/shopping_cart.dart';
import 'package:food/widget/drawer_menu_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:food/components/bottom_navaigation.dart';

class ContentHome extends StatelessWidget {
  final VoidCallback openDrawer;

  const ContentHome({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DrawerMenuWidget(onClicked: openDrawer),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingCart(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
              ],
            ),
            const Text(
              "Delicious \nfood for you",
              style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 14.0,
            ),
            TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                contentPadding: EdgeInsets.all(18.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            Expanded(
              child: Material(
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: TabBar(
                          indicatorColor: HexColor('#FA4A0C'),
                          labelColor: HexColor('#FA4A0C'),
                          unselectedLabelColor: HexColor('#9A9A9D'),
                          labelStyle: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                          tabs: const [
                            Tab(
                              child: Text(
                                'Food',
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Drinks',
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Snacks',
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Sauce',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
